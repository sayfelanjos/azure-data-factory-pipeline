param dataFactoryName string

var pipelineName = 'copy_data_courses_pl'

resource courses_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
          retryIntervalInSeconds: 180
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
              interimSchemaName: 'neolude'
              keys: [
                'CourseID'
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
                  path: 'CourseID'
                }
                sink: {
                  name: 'CourseID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'ClientUniqueIdentifier'
                }
                sink: {
                  name: 'ClientUniqueIdentifier'
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
                  path: 'CourseName'
                }
                sink: {
                  name: 'CourseName'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'CourseTypeID'
                }
                sink: {
                  name: 'CourseTypeID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'CourseType_Identifier'
                }
                sink: {
                  name: 'CourseType_Identifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'RegisterOriginTypeID'
                }
                sink: {
                  name: 'RegisterOriginTypeID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'RegisterOriginType_Identifier'
                }
                sink: {
                  name: 'RegisterOriginType_Identifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'CourseModeID'
                }
                sink: {
                  name: 'CourseModeID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'CourseMode_Identifier'
                }
                sink: {
                  name: 'CourseMode_Identifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'EstimatedDuration'
                }
                sink: {
                  name: 'EstimatedDuration'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'MinimumScoringGrade'
                }
                sink: {
                  name: 'MinimumScoringGrade'
                  type: 'Double'
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
                  path: 'Points_ScoreOnActivityConclusion'
                }
                sink: {
                  name: 'Points_ScoreOnActivityConclusion'
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
            referenceName: 'courses_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                type: 'Expression'
                value: 'courses?page={pagina}&page_size=5000'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'courses_tb'
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
