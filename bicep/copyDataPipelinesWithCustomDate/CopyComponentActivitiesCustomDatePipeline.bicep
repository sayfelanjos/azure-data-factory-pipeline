param azureDataFactoryName string

var pipelineName = 'CopyComponentActivitiesCustomDatePipeline'

resource componentactivities_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
                'ComponentActivityID'
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
                  path: 'ComponentActivityID'
                }
                sink: {
                  name: 'ComponentActivityID'
                  type: 'Int32'
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
                  path: 'ComponentActivityName'
                }
                sink: {
                  name: 'ComponentActivityName'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'ComponentActivityOrder'
                }
                sink: {
                  name: 'ComponentActivityOrder'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'ModuleActivityID'
                }
                sink: {
                  name: 'ModuleActivityID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'ModuleActivityTypeID'
                }
                sink: {
                  name: 'ModuleActivityTypeID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'ModuleActivityTypeIdentifier'
                }
                sink: {
                  name: 'ModuleActivityTypeIdentifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'IsGradable'
                }
                sink: {
                  name: 'IsGradable'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'GradeTypeID'
                }
                sink: {
                  name: 'GradeTypeID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'GradeTypeIdentifier'
                }
                sink: {
                  name: 'GradeTypeIdentifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'GradeScale'
                }
                sink: {
                  name: 'GradeScale'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'AccountProgress'
                }
                sink: {
                  name: 'AccountProgress'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'EvidenceIsMandatory'
                }
                sink: {
                  name: 'EvidenceIsMandatory'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'VisibilityID'
                }
                sink: {
                  name: 'VisibilityID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'VisibilityIdentifier'
                }
                sink: {
                  name: 'VisibilityIdentifier'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'VisibilityBeginning'
                }
                sink: {
                  name: 'VisibilityBeginning'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'VisibilityEnding'
                }
                sink: {
                  name: 'VisibilityEnding'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'VisibilityHoldDays'
                }
                sink: {
                  name: 'VisibilityHoldDays'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'VisibilityAvailableDays'
                }
                sink: {
                  name: 'VisibilityAvailableDays'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'ComponentID'
                }
                sink: {
                  name: 'ComponentID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'ComponentName'
                }
                sink: {
                  name: 'ComponentName'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'ComponentOrder'
                }
                sink: {
                  name: 'ComponentOrder'
                  type: 'Int16'
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
                  path: 'CourseID'
                }
                sink: {
                  name: 'CourseID'
                  type: 'Int32'
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
            referenceName: 'ComponentActivitiesEndPoint'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'componentactivities?page={pagina}&page_size=5000&update_start_date=@{pipeline().globalParameters.NewRunPipelineDateGlobalVariable}'
                type: 'Expression'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'ComponentActivitiesTable'
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
