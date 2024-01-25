param dataFactoryName string

var pipelineName = 'copy_data_enrollables_pl'

resource enrollables_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
          retryIntervalInSeconds: 300
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
                'EnrollableID'
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
                  path: 'EnrollableID'
                }
                sink: {
                  name: 'EnrollableID'
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
                  type: 'Int64'
                }
              }
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
                  path: 'Status_ID'
                }
                sink: {
                  name: 'Status_ID'
                  type: 'Int64'
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
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'Beginning'
                }
                sink: {
                  name: 'Beginning'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Ending'
                }
                sink: {
                  name: 'Ending'
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
                  path: 'EnrollableEnrollmentMethodID'
                }
                sink: {
                  name: 'EnrollableEnrollmentMethodID'
                  type: 'Int64'
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
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'KeepInProgress'
                }
                sink: {
                  name: 'KeepInProgress'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'PlaceID'
                }
                sink: {
                  name: 'PlaceID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'PlaceRoomID'
                }
                sink: {
                  name: 'PlaceRoomID'
                  type: 'String'
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
            referenceName: 'enrollables_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'enrollables_tb'
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
