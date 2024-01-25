param dataFactoryName string

var pipelineName = 'copy_data_videos_pl'

resource videos_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'OneToOneCopyPipeline'
        description: 'Copy data from rest api to sql database table'
        type: 'Copy'
        dependsOn: []
        policy: {
          timeout: '2.00:00:00'
          retry: 4
          retryIntervalInSeconds: 180
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
              useTempDB: false
              interimSchemaName: 'neolude'
              keys: [
                'VideoID'
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
                  path: 'VideoID'
                }
                sink: {
                  name: 'VideoID'
                  type: 'Double'
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
                  path: 'Title'
                }
                sink: {
                  name: 'Title'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'FullPath'
                }
                sink: {
                  name: 'FullPath'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Duration'
                }
                sink: {
                  name: 'Duration'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'VideoStatusID'
                }
                sink: {
                  name: 'VideoStatusID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'VideoStatus_Identifier'
                }
                sink: {
                  name: 'VideoStatus_Identifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'IsLive'
                }
                sink: {
                  name: 'IsLive'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'SeekEnabled'
                }
                sink: {
                  name: 'SeekEnabled'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'IsExternal'
                }
                sink: {
                  name: 'IsExternal'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'AuditCreatedDate'
                }
                sink: {
                  name: 'AuditCreatedDate'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'AuditLastUpdatedDate'
                }
                sink: {
                  name: 'AuditLastUpdatedDate'
                  type: 'String'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'Page\']'
                }
                sink: {
                  name: 'Page'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'PageSize\']'
                }
                sink: {
                  name: 'PageSize'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'MaximumPageSize\']'
                }
                sink: {
                  name: 'MaximumPageSize'
                  type: 'Int64'
                }
              }
            ]
            collectionReference: '$[\'data\']'
            mapComplexValuesToString: true
          }
        }
        inputs: [
          {
            referenceName: 'videos_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'videos_tb'
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
