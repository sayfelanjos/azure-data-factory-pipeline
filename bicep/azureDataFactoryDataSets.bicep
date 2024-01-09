@allowed([
  'dev'
  'stg'
  'prod'
])
param environment string

param department string

param customer string

@description('Data Factory Name')
param dataFactoryName string = 'adf-${customer}-${department}-${environment}'

var dataFactoryDataSetInName = 'rest_api_dataset'
var dataFactoryDataSetOutName = 'sql_server_dataset'
var dataFactoryRestLinkedServiceName = 'rest-api-linked-service'
var dataFactorySqlDatabaseLinkedServiceName = 'sql-database-linked-service'

@description('Relative URL is the last part of the url start after the Top-Level-Domain')
param relativeURL string

resource dataFactoryRestLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' existing = {
  name: dataFactoryRestLinkedServiceName
}

resource dataFactorySqlDatabaseLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' existing = {
  name: dataFactorySqlDatabaseLinkedServiceName
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource dataFactoryDataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: dataFactoryDataSetInName
  properties: {
    linkedServiceName: {
      referenceName: dataFactoryRestLinkedService.name
      type: 'LinkedServiceReference'
    }
    type: 'RestResource'
    typeProperties: {
      relativeUrl: relativeURL
      requestMethod: 'Get'
    }
  }
}

resource dataFactoryDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: dataFactoryDataSetOutName
  properties: {
    linkedServiceName: {
      referenceName: dataFactorySqlDatabaseLinkedService.name
      type: 'LinkedServiceReference'
    }
    type: 'AzureSqlTable'
    structure: [
      {
        name: 'id'
        type: 'Int64'
      }
      {
        name: 'name'
        type: 'String'
      }
      {
        name: 'username'
        type: 'String'
      }
      {
        name: 'email'
        type: 'String'
      }
      {
        name: 'street'
        type: 'String'
      }
      {
        name: 'suite'
        type: 'String'
      }
      {
        name: 'city'
        type: 'String'
      }
      {
        name: 'zipcode'
        type: 'String'
      }
      {
        name: 'lat'
        type: 'String'
      }
      {
        name: 'lng'
        type: 'String'
      }
      {
        name: 'phone'
        type: 'String'
      }
      {
        name: 'website'
        type: 'String'
      }
      {
        name: 'company_name'
        type: 'String'
      }
      {
        name: 'company_catch_phrase'
        type: 'String'
      }
      {
        name: 'company_bs'
        type: 'String'
      }
    ]
    typeProperties: {
      tableName: '[neolude].[dbo.users]'
    }
  }
}
