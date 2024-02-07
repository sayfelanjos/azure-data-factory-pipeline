param dataFactoryName string

var pipelineName = 'copy_data_surveyanswerquestions_pl'

resource surveyanswerquestions_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
          retry: 2
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
              useTempDB: false
              interimSchemaName: 'Research'
              keys: [
                'SurveyQuestionAnswerID'
              ]
            }
            sqlWriterUseTableLock: true
            tableOption: 'none'
            disableMetricsCollection: false
          }
          translator: {
            type: 'TabularTranslator'
            mappings: [
              {
                source: {
                  path: 'SurveyQuestionAnswerID'
                }
                sink: {
                  name: 'SurveyQuestionAnswerID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'SurveyAnswerID'
                }
                sink: {
                  name: 'SurveyAnswerID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'SurveyQuestionID'
                }
                sink: {
                  name: 'SurveyQuestionID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'SurveyQuestionOptionID'
                }
                sink: {
                  name: 'SurveyQuestionOptionID'
                  type: 'Int32'
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
                  path: 'Justification'
                }
                sink: {
                  name: 'Justification'
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
            referenceName: 'surveyanswerquestions_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'surveyanswerquestions_tb'
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
