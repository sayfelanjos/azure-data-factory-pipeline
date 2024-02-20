param azureDataFactoryName string

var pipelineName = 'CopyCoursesCustomDatePipeline'

resource courses_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
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
              interimSchemaName: 'Courses'
              keys: [
                'CourseID'
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
                  path: 'CourseID'
                }
                sink: {
                  name: 'CourseID'
                  type: 'Int32'
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
                  type: 'Int32'
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
                  type: 'Int32'
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
                  type: 'Int32'
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
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'MinimumScoringGrade'
                }
                sink: {
                  name: 'MinimumScoringGrade'
                  type: 'Decimal'
                }
              }
              {
                source: {
                  path: 'Points'
                }
                sink: {
                  name: 'Points'
                  type: 'Int32'
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
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'PageSize\']'
                }
                sink: {
                  name: 'PageSize'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: '$[\'metadata\'][\'MaximumPageSize\']'
                }
                sink: {
                  name: 'MaximumPageSize'
                  type: 'Int32'
                }
              }
            ]
            collectionReference: '$[\'data\']'
            mapComplexValuesToString: false
          }
        }
        inputs: [
          {
            referenceName: 'CoursesEndPoint'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'courses?page={pagina}&page_size=5000&update_start_date=@{pipeline().globalParameters.NewRunPipelineDateGlobalVariable}'
                type: 'Expression'
              }
            }

          }
        ]
        outputs: [
          {
            referenceName: 'CoursesTable'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    annotations: []
    folder: {
      name: 'CopyDataPipelinesWithCustomDate'
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
