param dataFactoryName string

var pipelineName = 'copy_data_surveyquestions_pl'

resource surveys_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
          retry: 5
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
              interimSchemaName: 'neolude'
              keys: [
                'SurveyQuestionID'
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
                  path: 'SurveyQuestionID'
                }
                sink: {
                  name: 'SurveyQuestionID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'Question'
                }
                sink: {
                  name: 'Question'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'SurveyID'
                }
                sink: {
                  name: 'SurveyID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'SurveyOrder'
                }
                sink: {
                  name: 'SurveyOrder'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'SurveyQuestionTypeID'
                }
                sink: {
                  name: 'SurveyQuestionTypeID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'SurveyQuestionType_Identifier'
                }
                sink: {
                  name: 'SurveyQuestionType_Identifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'SurveyQuestionType_HasOptions'
                }
                sink: {
                  name: 'SurveyQuestionType_HasOptions'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'GroupingID'
                }
                sink: {
                  name: 'GroupingID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'SurveyQuestionGrouping_Title'
                }
                sink: {
                  name: 'SurveyQuestionGrouping_Title'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'IsJustificationMandatory'
                }
                sink: {
                  name: 'IsJustificationMandatory'
                  type: 'Boolean'
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
            referenceName: 'surveyquestions_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'surveyquestions_tb'
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
