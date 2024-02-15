@description('The name of the SQL logical server.')
param serverName string

@description('The name of the SQL Database.')
param dbName string

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
  properties: {
    maxSizeBytes: 34359738368
    minCapacity: 1
    requestedBackupStorageRedundancy: 'Zone'
  }
  sku: {
    name: 'GP_S_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 8
  }
}

resource sqlAllowAllInternalAzureIps 'Microsoft.Sql/servers/firewallRules@2023-05-01-preview' = {
  name: 'AllowAllInternalAzureIps'
  parent: sqlServer
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource sqlAllowSaymonWindowsDesktoplIp 'Microsoft.Sql/servers/firewallRules@2023-05-01-preview' = {
  name: 'AllowSaymonWindowsDesktoplIp'
  parent: sqlServer
  properties: {
    startIpAddress: '187.106.33.56'
    endIpAddress: '187.106.33.56'
  }
}

resource sqlAllowSaymonWindowsLaptopIpExternalIp 'Microsoft.Sql/servers/firewallRules@2023-05-01-preview' = {
  name: 'AllowSaymonWindowsLaptopIpIp'
  parent: sqlServer
  properties: {
    startIpAddress: '192.168.15.26'
    endIpAddress: '192.168.15.26'
  }
}

resource sqlAllowGlaucolIp 'Microsoft.Sql/servers/firewallRules@2023-05-01-preview' = {
  name: 'AllowGlaucoIp'
  parent: sqlServer
  properties: {
    startIpAddress: '189.121.201.218'
    endIpAddress: '189.121.201.218'
  }
}
