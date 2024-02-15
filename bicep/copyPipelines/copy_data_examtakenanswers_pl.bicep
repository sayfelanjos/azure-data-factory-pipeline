param dataFactoryName string
param updateStartDate string

var pipelineName = 'copy_data_examtakenanswers_pl'

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
          timeout: '00.12:00:00'
          retry: 0
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
              'AbsoluteUrl.{pagina}': 'RANGE:1:9999:1'
              'EndCondition:$[\'data\']': 'Empty'
            }
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'upsert'
            upsertSettings: {
              useTempDB: false
              interimSchemaName: 'Assessments'
              keys: [
                'ExamTakenID'
                'QuestionID'
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
                  path: 'Identifier'
                }
                sink: {
                  name: 'Identifier'
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
                  path: 'EssayAnswerID'
                }
                sink: {
                  name: 'EssayAnswerID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'MatchingAnswerID'
                }
                sink: {
                  name: 'MatchingAnswerID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'MultipleAnswerAnswerID'
                }
                sink: {
                  name: 'MultipleAnswerAnswerID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'MultipleChoiceAnswerID'
                }
                sink: {
                  name: 'MultipleChoiceAnswerID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'TrueOrFalseAnswerID'
                }
                sink: {
                  name: 'TrueOrFalseAnswerID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'ExamTakenID'
                }
                sink: {
                  name: 'ExamTakenID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'QuestionID'
                }
                sink: {
                  name: 'QuestionID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'Grade'
                }
                sink: {
                  name: 'Grade'
                  type: 'Decimal'
                }
              }
              {
                source: {
                  path: 'Answer'
                }
                sink: {
                  name: 'Answer'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'IsCorrect'
                }
                sink: {
                  name: 'IsCorrect'
                  type: 'Boolean'
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
            referenceName: 'examtakenanswers_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'examtakenanswers?page={pagina}&page_size=5000&update_start_date=${updateStartDate}'
                type: 'Expression'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'examtakenanswers_tb'
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
