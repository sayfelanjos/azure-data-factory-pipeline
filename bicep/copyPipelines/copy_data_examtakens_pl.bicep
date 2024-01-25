param dataFactoryName string

var pipelineName = 'copy_data_examtakens_pl'

resource examtakens_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'OneToOneCopyPipeline'
        description: 'Copy data from rest api to sql database table'
        type: 'Copy'
        dependsOn: []
        policy: {
          timeout: '1.00:00:00'
          retry: 2
          retryIntervalInSeconds: 60
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
                'ExamTakenID'
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
                  path: 'ExamTakenID'
                }
                sink: {
                  name: 'ExamTakenID'
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
                  path: 'ExamID'
                }
                sink: {
                  name: 'ExamID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'EnrollmentID'
                }
                sink: {
                  name: 'EnrollmentID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'UserID'
                }
                sink: {
                  name: 'UserID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'Attempt'
                }
                sink: {
                  name: 'Attempt'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'TimeSpent'
                }
                sink: {
                  name: 'TimeSpent'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'NeedsGrading'
                }
                sink: {
                  name: 'NeedsGrading'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'Grade'
                }
                sink: {
                  name: 'Grade'
                  type: 'Double'
                }
              }
              {
                source: {
                  path: 'Finished'
                }
                sink: {
                  name: 'Finished'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'CompletionDate'
                }
                sink: {
                  name: 'CompletionDate'
                  type: 'DateTimeOffset'
                }
              }
              {
                source: {
                  path: 'Locked'
                }
                sink: {
                  name: 'Locked'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'CreatedByLock'
                }
                sink: {
                  name: 'CreatedByLock'
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
            referenceName: 'examtakens_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'examtakens_tb'
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
