param resourceGroupName string = resourceGroup().name
var dataFactoryName = '${resourceGroupName}-data-factory'
var dataFactoryDataSetInName = 'rest_api_dataset'
var dataFactoryDataSetOutName = 'sql_server_dataset'
var pipelineName = 'copy-from-rest-api-to-sql-database-pipeline'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource dataFactoryDataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: dataFactoryDataSetInName
}

resource dataFactoryDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: dataFactoryDataSetOutName
}

resource dataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  parent: dataFactory
  name: pipelineName
  properties: {
    activities: [
      {
        name: 'CopyFromRestToSQLDatabase'
        type: 'Copy'
        typeProperties: {
          source: {
            type: 'RestSource'
            requestMethod: 'GET'
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'insert'
            sqlWriterUseTableLock: false
            disableMetricsCollection: false
          }
          enableStaging: false
          translator: {
            type: 'TabularTranslator'
            schemaMapping: {
              id: 'id'
              name: 'name'
              username: 'username'
              email: 'email'
              'address.street': 'street'
              'address.suite': 'suite'
              'address.city': 'city'
              'address.zipcode': 'zipcode'
              'address.geo.lat': 'lat'
              'address.geo.lng': 'lng'
              phone: 'phone'
              website: 'website'
              'company.name': 'company_name'
              'company.catchPhrase': 'company_catch_phrase'
              'company.bs': 'company_bs'
            }
          }
        }
        inputs: [
          {
            referenceName: dataFactoryDataSetIn.name
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: dataFactoryDataSetOut.name
            type: 'DatasetReference'
          }
        ]
      }
    ]
  }
}
