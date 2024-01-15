@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource symbolicname 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
    name: 'copy_data_position'
    parent: dataFactory
    description: 'Extract data from rest api to sql database'
    properties: {
        activities: [
            {
              name: 'CopyFromRestToSQLDatabase'
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
                retry: 0
                retryIntervalInSeconds: 30
                secureOutput: False
                secureInput: False
              }
              userProperties: []
              typeProperties: {
                source: {
                  type: 'RestSource'
                  requestMethod: 'GET'
                  requestInternal: ''
                  httpRequestTimeout: '00:01:40'
                  paginationRules: '@{AbsoluteUrl.{pagina}=RANGE:1:9999:1; EndCondition:$['data']=Empty}'
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  sqlWriterUseTableLock: 'True'
                  tableOption: ''
                  disableMetricsCollection: 'False'
                }
                enableStaging: 'False'
                translator: 
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
