param dataFactoryName string
param updateStartDate string

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
              interimSchemaName: 'Files'
              keys: [
                'MediaContentID'
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
                  path: 'MediaContentID'
                }
                sink: {
                  name: 'MediaContentID'
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
                  path: 'CategoryID'
                }
                sink: {
                  name: 'CategoryID'
                  type: 'Int32'
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
                  type: 'Int32'
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
                  type: 'Int16'
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
            referenceName: 'medialibraryhtmls_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'medialibraryhtmls?page={pagina}&page_size=5000&update_start_date=${updateStartDate}'
              }
            }

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
      name: 'CopyPipelines'
    }
    parameters: {}
    runDimensions: {}
    variables: {}

  }
}
