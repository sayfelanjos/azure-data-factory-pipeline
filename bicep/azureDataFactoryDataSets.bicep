param resourceGroupName string = resourceGroup().name
var dataFactoryName = '${resourceGroupName}-data-factory'
var dataFactoryDataSetInName = '${resourceGroupName}-data-source'
var dataFactoryDataSetOutName = '${resourceGroupName}-data-destination'
var dataFactoryRestLinkedServiceName = 'copy-from-rest-api'
var dataFactorySqlDatabaseLinkedServiceName = 'copy-to-sql-server-database'

@description('Relative URL is the last part of the url start after the Top-Level-Domain')
param relativeURL string

resource dataFactoryRestLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' existing = {
  name: dataFactoryRestLinkedServiceName
}

resource dataFactorySqlDatabaseLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' existing = {
  name: dataFactorySqlDatabaseLinkedServiceName
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
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
      relativeUrl: relativeURL
      requestMethod: 'Get'
    }
  }
}

resource dataFactoryDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: dataFactoryDataSetOutName
  properties: {
    linkedServiceName: {
      referenceName: dataFactorySqlDatabaseLinkedService.name
      type: 'LinkedServiceReference'
    }
    type: 'AzureSqlTable'
    // typeProperties: {
    //   schema: any()
    //   table: any()
    //   tableName: any()
    // }
  }
}
