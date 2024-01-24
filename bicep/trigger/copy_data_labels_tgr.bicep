@description('Data Factory Name')
param dataFactoryName string

param utcTime string = utcNow('u')
var timeNow = dateTimeAdd(utcTime, '-PT3H')
var startTime = dateTimeAdd(timeNow, 'PT0H1M')
var endTime = dateTimeAdd(startTime, 'PT1Y')

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource trigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  name: 'copy_data_labels_tgr'
  parent: dataFactory
  properties: {
    type: 'ScheduleTrigger'
    pipelines: [
      {
        parameters: {}
        pipelineReference: {
          referenceName: 'copy_data_labels_pl'
          type: 'PipelineReference'
        }
      }
    ]
    typeProperties: {
      recurrence: {
        frequency: 'Week'
        endTime: endTime
        interval: 1
        startTime: startTime
        timeZone: 'E. South America Standard Time'
      }
    }
  }
}
