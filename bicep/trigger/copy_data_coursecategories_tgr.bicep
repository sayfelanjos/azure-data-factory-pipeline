@description('Data Factory Name')
param dataFactoryName string

param utcTime string = utcNow('u')
var startTime = dateTimeAdd(utcTime, '-PT2H58M')
var endTime = dateTimeAdd(startTime, 'PT1M30S')

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource azureDataFactoryTrigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  name: 'copy_data_coursecategories_tgr'
  parent: dataFactory
  properties: {
    type: 'ScheduleTrigger'
    pipelines: [
      {
        parameters: {}
        pipelineReference: {
          referenceName: 'copy_data_coursecategories_pl'
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
