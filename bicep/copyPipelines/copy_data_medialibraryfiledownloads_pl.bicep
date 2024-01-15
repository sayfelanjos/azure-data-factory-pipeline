param dataFactoryName string

var pipelineName = 'copy_data_medialibraryfiledownloads_pl'

resource copyPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'OneToOneCopyPipeline'
        description: 'Copy data from rest api to sql database table'
        type: 'Copy'
        dependsOn: []
        policy: {
          timeout: '0.12:00:00'
          retry: 0
          retryIntervalInSeconds: 30
          secureOutput: false
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          source: {
            type: 'RestSource'
            httpRequestTimeout: '00:01:40'
            requestInterval: '00.00:00:00.010'
            requestMethod: 'GET'
            paginationRules: {
              'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
              'EndCondition:$[\'data\']': 'Empty'
            }
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'upsert'
            upsertSettings: {
              useTempDB: true
              keys: [
                'DownloadHistoryID'
              ]
            }
            sqlWriterUseTableLock: true
            tableOption: 'autoCreate'
            disableMetricsCollection: false
          }
          translator: {
            type: 'TabularTranslator'
            mappings: [
              {
                source: {
                  path: 'DownloadHistoryID'
                }
                sink: {
                  name: 'DownloadHistoryID'
                }
              }
              {
                source: {
                  path: 'IsDeleted'
                }
                sink: {
                  name: 'IsDeleted'
                }
              }
              {
                source: {
                  path: 'FileAssignmentID'
                }
                sink: {
                  name: 'FileAssignmentID'
                }
              }
              {
                source: {
                  path: 'UserID'
                }
                sink: {
                  name: 'UserID'
                }
              }
              {
                source: {
                  path: 'FileName'
                }
                sink: {
                  name: 'FileName'
                }
              }
              {
                source: {
                  path: 'Title'
                }
                sink: {
                  name: 'Title'
                }
              }
              {
                source: {
                  path: 'Description'
                }
                sink: {
                  name: 'Description'
                }
              }
              {
                source: {
                  path: 'DownloadDate'
                }
                sink: {
                  name: 'DownloadDate'
                }
              }
              {
                source: {
                  path: 'AuditCreatedDate'
                }
                sink: {
                  name: 'AuditCreatedDate'
                }
              }
              {
                source: {
                  path: 'AuditLastUpdatedDate'
                }
                sink: {
                  name: 'AuditLastUpdatedDate'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'Page\']'
                }
                sink: {
                  name: 'Page'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'PageSize\']'
                }
                sink: {
                  name: 'PageSize'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'MaximumPageSize\']'
                }
                sink: {
                  name: 'MaximumPageSize'
                }
              }
            ]
            collectionReference: '$[\'data\']'
            mapComplexValuesToString: true
          }
        }
        inputs: [
          {
            referenceName: 'medialibraryfiledownloads_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'medialibraryfiledownloads_tb'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    annotations: []
    folder: {
      name: 'one_to_one_copy_pl'
    }
    parameters: {}
    runDimensions: {}
    variables: {}
  }
}
