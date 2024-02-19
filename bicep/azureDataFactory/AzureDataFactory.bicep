@description('Data Factory Name')
param dataFactoryName string


@description('Location of the data factory.')
param location string = resourceGroup().location

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}

resource azureDataFactoryGlobalVariable 'Microsoft.DataFactory/factories/globalParameters@2018-06-01' = {
  name: 'NewRunPipelineDateGlobalVariable'
  parent: azureDataFactory
  properties: {
    GlobalParameterSpecification: {
      value: '1999-12-31T23:59:59.000'
      type: 'String'
    }
  }
}
