@description('Data Factory Name')
param dataFactoryName string

param dataFactory_properties_globalParameters_NewRunPipelineDateGlobalVariable_value string = '1999-31-12T23:59:59.999'

@description('Location of the data factory.')
param location string = resourceGroup().location

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    globalParameters: {
      NewRunPipelineDateGlobalVariable: {
        type: 'string'
        value: dataFactory_properties_globalParameters_NewRunPipelineDateGlobalVariable_value
      }
    }
  }
}
