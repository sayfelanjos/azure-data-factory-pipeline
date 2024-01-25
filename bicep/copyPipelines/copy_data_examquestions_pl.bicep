param dataFactoryName string

var pipelineName = 'copy_data_examquestions_pl'

resource examquestions_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
                'ExamQuestionID'
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
                  path: 'ExamQuestionID'
                }
                sink: {
                  name: 'ExamQuestionID'
                  type: 'Int64'
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
                  path: 'QuestionID'
                }
                sink: {
                  name: 'QuestionID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'Order'
                }
                sink: {
                  name: 'Order'
                  type: 'Int64'
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
                  path: 'QuestionGroupID'
                }
                sink: {
                  name: 'QuestionGroupID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'QuestionGroup_Title'
                }
                sink: {
                  name: 'QuestionGroup_Title'
                  type: 'String'
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
            referenceName: 'examquestions_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'examquestions_tb'
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
