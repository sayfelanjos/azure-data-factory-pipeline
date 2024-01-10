@allowed([
  'dev'
  'stg'
  'prod'
])
param environment string

param department string

param customer string

@description('Data Factory Name')
param dataFactoryName string = '${customer}-${department}-${environment}-adf'

var pipelineName = 'copy-pipeline'
var azureDataFactoryTriggerName = '${pipelineName}-trigger'
param utcTime string = utcNow('u')
var startTime = dateTimeAdd(utcTime, '-PT2H58M')
var endTime = dateTimeAdd(startTime, 'PT1M30S')

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource azureDataFactoryTrigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  name: azureDataFactoryTriggerName
  parent: dataFactory
  properties: {
    type: 'ScheduleTrigger'
    pipelines: [
      {
        parameters: {}
        pipelineReference: {
          referenceName: pipelineName
          type: 'PipelineReference'
        }
      }
    ]
    typeProperties: {
      recurrence: {
        frequency: 'Minute'
        endTime: endTime
        interval: 1
        startTime: startTime
        timeZone: 'E. South America Standard Time'
      }
    }
  }
}
