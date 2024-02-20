param azureDataFactoryName string

var pipelineName = 'CopyEnrollmentsDataWithAutoSetDatePipeline'

resource enrollments_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
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
              interimSchemaName: 'Courses'
              keys: [
                'EnrollmentID'
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
            referenceName: 'EnrollmentsEndPoint'
            type: 'DatasetReference'
            parameters: {
              SetApiName: 'enrollments?page={pagina}&page_size=5000&update_start_date=@{variables(\'NextRunPipelineDate\')}'
              type: 'Expression'
            }
          }
        ]
        outputs: [
          {
            referenceName: 'EnrollmentsTable'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    annotations: []
    folder: {
      name: 'CopyDataPipelinesWithAutoSetDate'
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
