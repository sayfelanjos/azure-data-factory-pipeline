param pipelineName string 

@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource execute_copyPipelines_pl 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: pipelineName
  parent: dataFactory
  properties: {
    activities: [
     
    ]
    annotations: []
  }
}
