@description('The name of the SQL logical server.')
param serverName string = '${resourceGroup().name}-sql-server'

@description('The name of the SQL Database.')
param dbName string = '${resourceGroup().name}-sql-database'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param sqlServerUserName string

@description('The administrator password of the SQL logical server.')
@secure()
param sqlServerPassword string

module sqlServer './sqlServerModule.bicep' = {
  name: 'deploySQL'
  params: {
    serverName: serverName
    location: location
    sqlServerAdminLogin: sqlServerUserName
    sqlServerAdminPassword: sqlServerPassword
    dbName: dbName
  }
}
