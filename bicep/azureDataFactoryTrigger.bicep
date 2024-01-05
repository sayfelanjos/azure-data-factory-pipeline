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
    annotations: [
      any
    ]
    description: 'string'
    type: 'string'
    // For remaining properties, see Trigger objects
  }
}
