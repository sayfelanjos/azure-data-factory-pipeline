@description('Data Factory Name')
param dataFactoryName string

param utcTime string = utcNow('u')
var startTime = dateTimeAdd(utcTime, '-PT3H')

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource trigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  name: 'ExecuteAllCopyDataPipelinesTrigger'
  parent: dataFactory
  properties: {
    type: 'ScheduleTrigger'
    pipelines: [
      {
        parameters: {}
        pipelineReference: {
          referenceName: 'ExecuteAllCopyDataPipelines'
          type: 'PipelineReference'
        }
      }
    ]
    typeProperties: {
      recurrence: {
        frequency: 'Day'
        interval: 1
        startTime: startTime
        timeZone: 'E. South America Standard Time'
      }
    }
  }
}
