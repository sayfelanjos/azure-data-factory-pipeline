param dataFactoryName string

var pipelineName = 'copy_data_medialibraryhtmls_pl'

resource medialibraryhtmls_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
            httpRequestTimeout: '00:05:00'
            requestInterval: '00.00:01:00'
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
                'MediaContentID'
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
                  path: 'MediaContentID'
                }
                sink: {
                  name: 'MediaContentID'
                  type: 'Int64'
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
                  path: 'CategoryID'
                }
                sink: {
                  name: 'CategoryID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'Media_Name'
                }
                sink: {
                  name: 'Media_Name'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'HTMLPageID'
                }
                sink: {
                  name: 'HTMLPageID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'IsEnabled'
                }
                sink: {
                  name: 'IsEnabled'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'DisplayDate'
                }
                sink: {
                  name: 'DisplayDate'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Points'
                }
                sink: {
                  name: 'Points'
                  type: 'Int64'
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
            referenceName: 'medialibraryhtmls_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'medialibraryhtmls_tb'
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
