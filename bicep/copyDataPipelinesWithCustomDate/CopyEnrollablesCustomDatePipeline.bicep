param azureDataFactoryName string

var pipelineName = 'CopyEnrollablesCustomDatePipeline'

resource enrollables_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: pipelineName
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
                'EnrollableID'
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
                  path: 'EnrollableID'
                }
                sink: {
                  name: 'EnrollableID'
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
                  path: 'EnrollableName'
                }
                sink: {
                  name: 'EnrollableName'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'SourceEnrollableID'
                }
                sink: {
                  name: 'SourceEnrollableID'
                  type: 'Int32'
                }
              }
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
                  path: 'Status_ID'
                }
                sink: {
                  name: 'Status_ID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'Status_Identifier'
                }
                sink: {
                  name: 'Status_Identifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'EnrollableCancellationReasonID'
                }
                sink: {
                  name: 'EnrollableCancellationReasonID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'Beginning'
                }
                sink: {
                  name: 'Beginning'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'Ending'
                }
                sink: {
                  name: 'Ending'
                  type: 'Datetime'
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
                  path: 'EnrollableEnrollmentMethodID'
                }
                sink: {
                  name: 'EnrollableEnrollmentMethodID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'EnrollableEnrollmentMethod_Identifier'
                }
                sink: {
                  name: 'EnrollableEnrollmentMethod_Identifier'
                  type: 'String'
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
                  path: 'KeepInProgress'
                }
                sink: {
                  name: 'KeepInProgress'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'PlaceID'
                }
                sink: {
                  name: 'PlaceID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'PlaceRoomID'
                }
                sink: {
                  name: 'PlaceRoomID'
                  type: 'Decimal'
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
            referenceName: 'EnrollablesEndPoint'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'enrollables?page={pagina}&page_size=5000&update_start_date=@{pipeline().globalParameters.NewRunPipelineDateGlobalVariable}'
                type: 'Expression'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'EnrollablesTable'
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
