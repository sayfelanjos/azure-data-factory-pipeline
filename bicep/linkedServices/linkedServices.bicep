@description('Data Factory Name')
param dataFactoryName string

@description('The customer API URL')
param baseURL string 

@description('Secure string, token, to access API')
@secure()
param apiSecureString string

param sqlServerAdminLogin string

@secure()
param sqlServerAdminPassword string

param serverName string
param dbName string
var restLinkedServiceName = 'rest-api-linked-service'
var sqlDatabaseLinkedServiceName = 'sqldb-linked-service'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource dataFactoryRestLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  parent: dataFactory
  name: restLinkedServiceName
  properties: {
    type: 'RestService'
    annotations: []
    description: 'Connects to API to extract data'
    typeProperties: {
      authenticationType: 'Anonymous'
      authHeaders: {
        'x-api-key': {
          type: 'SecureString'
          value: apiSecureString
        }
      }
      enableServerCertificateValidation: true
      url: baseURL
    }
  }
}

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' existing = {
  name: serverName
}

resource dataFactorySqlDatabaseLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  name: sqlDatabaseLinkedServiceName
  parent: dataFactory
  properties: {
    annotations: []
    type: 'AzureSqlDatabase'
    description: 'Connects Azure Data Factory to Azure SQL Server'
    typeProperties: {
      connectionString: 'Data Source=${sqlServer.properties.fullyQualifiedDomainName};Connection TimeOut=30;Initial Catalog=${dbName};Integrated Security=False;User ID=${sqlServerAdminLogin};Password=${sqlServerAdminPassword};'
    }
  }

}
