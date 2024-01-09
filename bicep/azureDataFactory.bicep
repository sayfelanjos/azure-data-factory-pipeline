@allowed([
  'dev'
  'stg'
  'prod'
])
param environment string

param department string

@description('Data Factory Name')
param dataFactoryName string = 'adf-${department}-${environment}'


@description('Location of the data factory.')
param location string = resourceGroup().location

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}
