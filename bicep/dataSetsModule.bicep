param dataFactoryName string
param DataSetInName string
param DataSetOutName string
param RestLinkedServiceName string
param SqlDatabaseLinkedServiceName string
param schemaName string
param tableName string
param folderName string
param tableStructure string

@description('Relative URL is the last part of the url start after the Top-Level-Domain')
param relativeURL string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource dataFactoryDataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: DataSetInName
  properties: {
    linkedServiceName: {
      referenceName: RestLinkedServiceName
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
  name: DataSetOutName
  properties: {
    linkedServiceName: {
      referenceName: SqlDatabaseLinkedServiceName
      type: 'LinkedServiceReference'
    }
    type: 'AzureSqlTable'
    structure: tableStructure
    schema: []
    typeProperties: {
      table: schemaName
      schema: tableName
    }
    folder: {
      name: folderName
    }
  }
}
