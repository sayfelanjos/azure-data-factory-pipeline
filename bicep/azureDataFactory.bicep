@description('Data Factory Name')
param dataFactoryName string = 'datafactory${uniqueString(resourceGroup().id)}'

@description('Location of the data factory.')
param location string = resourceGroup().location

var baseURL = 'https://restcountries.com/v3.1'
var dataFactoryRestLinkedServiceName = 'CopyFromRestPipeline'
var dataFactorySqlDatabaseLinkedServiceName = 'CopyToBlobPipeline'
var dataFactoryDataSetInName = 'CountriesRestAPI'
var dataFactoryDataSetOutName = 'CountriesData'
var pipelineName = 'FromRestToBlobPipeline'

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

resource dataFactorySqlDatabaseLinkedService 'Microsoft.DataFactory/factories/linkedservices@2017-09-01-preview' = {
  name: dataFactorySqlDatabaseLinkedServiceName
  parent: dataFactory
  properties: {
    annotations: [
      any
    ]
    connectVia: {
      parameters: {}
      referenceName: 'string'
      type: 'IntegrationRuntimeReference'
    }
    description: 'string'
    parameters: {}
    type: 'AzureSqlDatabase'
    typeProperties: {
      connectionString: any()
      encryptedCredential: any()
      servicePrincipalId: any()
      servicePrincipalKey: {
        type: 'string'
        // For remaining properties, see SecretBase objects
      }
      tenant: any()
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
