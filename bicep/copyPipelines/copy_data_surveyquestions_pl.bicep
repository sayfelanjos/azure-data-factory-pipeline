param dataFactoryName string
param updateStartDate string

var pipelineName = 'copy_data_surveyquestions_pl'

resource surveys_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'SetNextRunPipelineDate'
        type: 'SetVariable'
        dependsOn: []
        policy: {
          secureInput: false
          secureOutput: false
        }
        userProperties: []
        typeProperties: {
          variableName: 'NextRunPipelineDate'
          value: {
            value: '@{formatDateTime(adddays(convertFromUtc(utcnow(), \'E. South America Standard Time\'), -1), \'yyyy-MM-ddT02:00:00\')}'
            type: 'Expression'
          }
        }
      }
      {
        name: 'OneToOneCopyPipeline'
        description: 'Copy data from rest api to sql database table'
        type: 'Copy'
        dependsOn: [
          {
            activity: 'SetNextRunPipelineDate'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
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
              interimSchemaName: 'Research'
              keys: [
                'SurveyQuestionID'
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
                  path: 'SurveyQuestionID'
                }
                sink: {
                  name: 'SurveyQuestionID'
                  type: 'Int32'
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
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'SurveyOrder'
                }
                sink: {
                  name: 'SurveyOrder'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'SurveyQuestionTypeID'
                }
                sink: {
                  name: 'SurveyQuestionTypeID'
                  type: 'Int32'
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
                  type: 'Int32'
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
            referenceName: 'surveyquestions_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'surveyquestions?page={pagina}&page_size=5000&update_start_date=${updateStartDate}'
                type: 'Expression'
              }
            }
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
      name: 'CopyPipelines'
    }
    parameters: {}
    runDimensions: {}
    variables: {
      NextRunPipelineDate: {
        type: 'String'
      }
    }

  }
}
