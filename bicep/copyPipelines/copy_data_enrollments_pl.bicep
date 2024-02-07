param dataFactoryName string

var pipelineName = 'copy_data_enrollments_pl'

resource enrollments_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              'AbsoluteUrl.{pagina}': 'RANGE:1:9999:1'
              'EndCondition:$[\'header\']': 'Empty'
            }
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'upsert'
            upsertSettings: {
              useTempDB: false
              interimSchemaName: 'Courses'
              keys: [
                'EnrollmentID'
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
                  path: 'EnrollmentID'
                }
                sink: {
                  name: 'EnrollmentID'
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
                  path: 'IsBlocked'
                }
                sink: {
                  name: 'IsBlocked'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'EnrollmentTypeID'
                }
                sink: {
                  name: 'EnrollmentTypeID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'EnrollmentType_Identifier'
                }
                sink: {
                  name: 'EnrollmentType_Identifier'
                  type: 'String'
                }
              }
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
                  path: 'UserID'
                }
                sink: {
                  name: 'UserID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'Progress'
                }
                sink: {
                  name: 'Progress'
                  type: 'Decimal'
                }
              }
              {
                source: {
                  path: 'AverageGrade'
                }
                sink: {
                  name: 'AverageGrade'
                  type: 'Decimal'
                }
              }
              {
                source: {
                  path: 'EnrollmentDate'
                }
                sink: {
                  name: 'EnrollmentDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'LastAccessDate'
                }
                sink: {
                  name: 'LastAccessDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'ConclusionDate'
                }
                sink: {
                  name: 'ConclusionDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'CourseUserStatusID'
                }
                sink: {
                  name: 'CourseUserStatusID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'CourseUserStatus_Identifier'
                }
                sink: {
                  name: 'CourseUserStatus_Identifier'
                  type: 'String'
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
            referenceName: 'enrollments_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'enrollments_tb'
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
