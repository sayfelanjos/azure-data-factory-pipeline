@description('Data Factory Name')
param dataFactoryName string
param pipelineName string
param datasetInName string
param datasetOutName string
param schemaMapping object

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource pipelineModule 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  parent: dataFactory
  name: pipelineName
  properties: {
    activities: [
      {
        name: 'CopyFromRestToSQLDatabase'
        type: 'Copy'
        typeProperties: {
          source: {
            type: 'RestSource'
            requestMethod: 'GET'
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'insert'
            sqlWriterUseTableLock: false
            disableMetricsCollection: false
          }

          translator: {
            type: 'TabularTranslator'
            schemaMapping: schemaMapping
          }
        }
        inputs: [
          {
            referenceName: datasetInName
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: datasetOutName
            type: 'DatasetReference'
          }
        ]
      }
    ]
  }
}
