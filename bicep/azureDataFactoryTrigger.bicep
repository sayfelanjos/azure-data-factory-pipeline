param resourceGroupName string = resourceGroup().name

@description('Data Factory Name')
param dataFactoryName string = '${resourceGroupName}-data-factory'

param azureDataFactoryTriggerName string = '${resourceGroupName}-azure-data-factory-trigger'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource azureDataFactoryTrigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  name: azureDataFactoryTriggerName
  parent: dataFactory
  properties: {
    description: 'string'
    type: 'ScheduleTrigger'
    pipelines: [
      {
        parameters: {
          OutputBlobNameList: [
            'data.json'
          ]
        }
        pipelineReference: {
          type: 'PipelineReference'
          referenceName: 'FromRestToBlobPipeline'
        }
      }
    ]
    typeProperties: {
      recurrence: {
        endTime: '2023-12-18T21:45:00.8441801Z'
        frequency: 'Minute'
        interval: 4
        startTime: '2023-12-18T21:40:00.8441801Z'
        timeZone: 'UTC'
      }
    }
  }
}
