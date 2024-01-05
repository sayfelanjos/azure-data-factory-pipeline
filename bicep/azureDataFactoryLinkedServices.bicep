@description('Customer API URL')
param baseURL string

param sqlServerUserName string

@secure()
param sqlServerPassword string

@secure()
param apiSecureString string

module azureDataFactoryLinkedServices './azureDataFactoryLinkedServicesModule.bicep' = {
  name: 'deployDataFactoryLinkedServicesName'
  params: {
    baseURL: baseURL
    apiSecureString: apiSecureString
    sqlServerUserName: sqlServerUserName
    sqlServerPassword: sqlServerPassword
  }
}
