@description('Data Factory Name')
param dataFactoryName string = 'datafactory${uniqueString(resourceGroup().id)}'

@description('Location of the data factory.')
param location string = resourceGroup().location

@description('Name of the Azure storage account that contains the input/output data.')
param storageAccountName string = 'storage${uniqueString(resourceGroup().id)}'

@description('Name of the blob container in the Azure Storage account.')
param blobContainerName string = 'blob${uniqueString(resourceGroup().id)}'


var baseURL = 'https://restcountries.com/v3.1'
var dataFactoryRestLinkedServiceName = 'CopyFromRestPipeline'
var dataFactoryBlobLinkedServiceName = 'CopyToBlobPipeline'
var dataFactoryDataSetInName = 'CountriesRestAPI'
var dataFactoryDataSetOutName = 'CountriesData'
var pipelineName = 'FromRestToBlobPipeline'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: '${storageAccount.name}/default/${blobContainerName}'
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}

resource dataFactoryRestLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  parent: dataFactory
  name: dataFactoryRestLinkedServiceName
  properties: {
    type: 'RestService'
    typeProperties: {
      // aadResourceId: any()
      authenticationType: 'Anonymous'
      // authHeaders: any()
      // azureCloudType: any()
      // clientId: any()
      // clientSecret: {
        // type: 'string'
        // For remaining properties, see SecretBase objects
      // }
      // credential: {
      //   referenceName: 'string'
      //   type: 'CredentialReference'
      // }
      enableServerCertificateValidation: false
      // encryptedCredential: any()
      // password: {
      //   type: 'string'
      //   // For remaining properties, see SecretBase objects
      // }
      // resource: any()
      // scope: any()
      // servicePrincipalId: any()
      // servicePrincipalKey: {
      //   type: 'string'
      //   // For remaining properties, see SecretBase objects
      // }
      // tenant: any()
      // tokenEndpoint: any()
      url: baseURL
      // userName: any()
    }
  }
}

resource dataFactoryBlobLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  parent: dataFactory
  name: dataFactoryBlobLinkedServiceName
  properties: {
    type: 'AzureBlobStorage'
    typeProperties: {
      connectionString: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};AccountKey=${storageAccount.listKeys().keys[0].value}'
    }
  }
}

resource dataFactoryDataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: dataFactoryDataSetInName
  properties: {
    linkedServiceName: {
      referenceName: dataFactoryRestLinkedService.name
      type: 'LinkedServiceReference'
    }
    type: 'RestResource'
    typeProperties: {
       relativeUrl: 'all'
      requestMethod: 'Get'
    }
  }
}

resource dataFactoryDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: dataFactoryDataSetOutName
  properties: {
    linkedServiceName: {
      referenceName: dataFactoryBlobLinkedService.name
      type: 'LinkedServiceReference'
    }
    type: 'Json'
    typeProperties: {
      location: {
        type: 'AzureBlobStorageLocation'
        container: blobContainerName
        folderPath: 'output'
        fileName: 'data.json'
      }
    }
  }
}

resource dataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  parent: dataFactory
  name: pipelineName
  properties: {
    activities: [
      {
        name: 'MyCopyActivity'
        type: 'Copy'
        typeProperties: {
          source: {
            type: 'BinarySource'
            storeSettings: {
              type: 'AzureBlobStorageReadSettings'
              recursive: true
            }
          }
          sink: {
            type: 'BinarySink'
            storeSettings: {
              type: 'AzureBlobStorageWriteSettings'
            }
          }
          enableStaging: false
        }
        inputs: [
          {
            referenceName: dataFactoryDataSetIn.name
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: dataFactoryDataSetOut.name
            type: 'DatasetReference'
          }
        ]
      }
    ]
  }
}
