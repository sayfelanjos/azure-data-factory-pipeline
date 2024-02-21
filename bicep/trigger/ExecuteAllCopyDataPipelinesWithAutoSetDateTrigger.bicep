@description('Data Factory Name')
param azureDataFactoryName string

param utcTime string = utcNow('u')
var startTime = dateTimeAdd(utcTime, '-PT3H')

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: azureDataFactoryName
}

resource trigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  name: 'ExecAllCopyDataPipelinesTrigger'
  parent: azureDataFactory
  properties: {
    type: 'ScheduleTrigger'
    pipelines: [
      {
        parameters: {}
        pipelineReference: {
          referenceName: 'ExecAllCopyDataPipelines'
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
        schedule: {
          hours: [
            02
          ]
          minutes: [
            00
          ]
        }
      }
    }
  }
}
