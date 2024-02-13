param dataFactoryName string
param updateStartDate string

var pipelineName = 'copy_data_videoviews_pl'

resource videoviews_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'OneToOneCopyPipeline'
        description: 'Copy data from rest api to sql database table'
        type: 'Copy'
        dependsOn: []
        policy: {
          timeout: '00.12:00:00'
          retry: 1
          retryIntervalInSeconds: 60
          secureOutput: false
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          source: {
            type: 'RestSource'
            httpRequestTimeout: '00:01:40'
            requestInterval: '00.00:00:00.060'
            requestMethod: 'GET'
            paginationRules: {
              'AbsoluteUrl.{pagina}': 'RANGE:1:9999:1'
              'EndCondition:$[\'data\']': 'Empty'
            }
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'upsert'
            upsertSettings: {
              useTempDB: false
              interimSchemaName: 'Contents'
              keys: [
                'VideoAccessHistoryID'
              ]
            }
            sqlWriterUseTableLock: true

            disableMetricsCollection: false
          }
          translator: {
            type: 'TabularTranslator'
            mappings: [
              {
                source: {
                  path: 'VideoAccessHistoryID'
                }
                sink: {
                  name: 'VideoAccessHistoryID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'IsDeleted'
                }
                sink: {
                  name: 'IsDeleted'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'UserID'
                }
                sink: {
                  name: 'UserID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'VideoID'
                }
                sink: {
                  name: 'VideoID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'AccessDate'
                }
                sink: {
                  name: 'AccessDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'AuditCreatedDate'
                }
                sink: {
                  name: 'AuditCreatedDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'AuditLastUpdatedDate'
                }
                sink: {
                  name: 'AuditLastUpdatedDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'Page\']'
                }
                sink: {
                  name: 'Page'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'PageSize\']'
                }
                sink: {
                  name: 'PageSize'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'MaximumPageSize\']'
                }
                sink: {
                  name: 'MaximumPageSize'
                  type: 'Int16'
                }
              }
            ]
            collectionReference: '$[\'data\']'
            mapComplexValuesToString: false
          }
        }
        inputs: [
          {
            referenceName: 'videoviews_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'videoviews?page={pagina}&page_size=5000&${updateStartDate}'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'videoviews_tb'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    annotations: []
    folder: {
      name: 'CopyPipelines'
    }
    parameters: {}
    runDimensions: {}
    variables: {}

  }
}
