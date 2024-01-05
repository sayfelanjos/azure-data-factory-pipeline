param resourceGroupName string = resourceGroup().name

@description('The name of the SQL logical server.')
param serverName string = '${resourceGroupName}-sql-server'

@description('The name of the SQL Database.')
param dbName string = '${resourceGroupName}-sql-database'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param sqlServerAdminLogin string

@description('The administrator password of the SQL logical server.')
@secure()
param sqlServerAdminPassword string

module sqlServer './sqlServerModule.bicep' = {
  name: 'deploySQL'
  params: {
    serverName: serverName
    location: location
    sqlServerAdminLogin: sqlServerAdminLogin
    sqlServerAdminPassword: sqlServerAdminPassword
    dbName: dbName
  }
}
