param resourceGroupName string = resourceGroup().name

@allowed([
  'dev'
  'stg'
  'prod'
])
param environment string

param department string

@description('The name of the SQL logical server.')
var serverName = 'sql-${department}-${environment}'

@description('The name of the SQL Database.')
var dbName = '${resourceGroupName}-sql-database'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param sqlServerAdminLogin string

@description('The administrator password of the SQL logical server.')
@secure()
param sqlServerAdminPassword string

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: sqlServerAdminLogin
    administratorLoginPassword: sqlServerAdminPassword
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: sqlServer
  name: dbName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource sqlAllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2023-05-01-preview' = {
  name: 'AllowAllWindowsAzureIps'
  parent: sqlServer
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
