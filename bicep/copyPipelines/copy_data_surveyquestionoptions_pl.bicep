param dataFactoryName string

var pipelineName = 'copy_data_surveyquestionoptions_pl'

resource surveyquestionoptions_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              interimSchemaName: 'neolude'
              keys: [
                'SurveyQuestionOptionID'
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
                  path: 'SurveyQuestionOptionID'
                }
                sink: {
                  name: 'SurveyQuestionOptionID'
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
                  path: 'Label'
                }
                sink: {
                  name: 'Label'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Value'
                }
                sink: {
                  name: 'Value'
                  type: 'String'
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
                  path: 'RequiresJustification'
                }
                sink: {
                  name: 'RequiresJustification'
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
            referenceName: 'surveyquestionoptions_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                type: 'Expression'
                value: 'surveyquestionoptions?page={pagina}&page_size=5000&update_start_date=2022-01-01'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'surveyquestionoptions_tb'
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
