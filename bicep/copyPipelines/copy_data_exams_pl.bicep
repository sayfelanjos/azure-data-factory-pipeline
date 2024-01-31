param dataFactoryName string

var pipelineName = 'copy_data_exams_pl'

resource exams_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
                'ExamID'
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
                  path: 'ExamID'
                }
                sink: {
                  name: 'ExamID'
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
                  path: 'AttemptsLimit'
                }
                sink: {
                  name: 'AttemptsLimit'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'DurationLimit'
                }
                sink: {
                  name: 'DurationLimit'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'KeepScoreTypeID'
                }
                sink: {
                  name: 'KeepScoreTypeID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'KeepScoreType_Identifier'
                }
                sink: {
                  name: 'KeepScoreType_Identifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'ExamTypeID'
                }
                sink: {
                  name: 'ExamTypeID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'ExamType_Identifier'
                }
                sink: {
                  name: 'ExamType_Identifier'
                  type: 'String'
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
            referenceName: 'exams_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'exams_tb'
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
