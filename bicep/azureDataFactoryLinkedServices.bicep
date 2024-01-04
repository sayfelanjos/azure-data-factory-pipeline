@description('Customer API URL')
param baseURL string
param sqlServerUserName string
@secure()
param sqlServerPassword string

var kvName = '${resourceGroup().name}-key-vault'

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: kvName
}

module azureDataFactoryLinkedServices './azureDataFactoryLinkedServicesModule.bicep' = {
  name: 'deployDataFactoryLinkedServicesName'
  params: {
    baseURL: baseURL
    apiSecureString: kv.getSecret('apiSecureString')
    sqlServerUserName: sqlServerUserName
    sqlServerPassword: sqlServerPassword
  }
}
