param dataFactoryName string

var pipelineName = 'CopyCourseActivityViewsDataWithAutoSetDatePipeline'

resource audios_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              interimSchemaName: 'CourseActivityViews'
              keys: [
                'CourseActivityViewsID'
              ]
            }
            sqlWriterUseTableLock: true
            disableMetricsCollection: false
          }
          translator: {
            type: 'TabularTranslator'
            typeConversion: true
            mappings: [
              {
                source: {
                  path: 'CourseActivityViewsID'
                }
                sink: {
                  name: 'CourseActivityViewsID'
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
                  path: 'EnrollableID'
                }
                sink: {
                  name: 'EnrollableID'
                  type: 'Int32'
                }
              }
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
                  path: 'UserID'
                }
                sink: {
                  name: 'UserID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'Identifier'
                }
                sink: {
                  name: 'Identifier'
                  type: 'String'
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
                  path: 'ModuleActivityID'
                }
                sink: {
                  name: 'ModuleActivityID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'Activity'
                }
                sink: {
                  name: 'Activity'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Attempt'
                }
                sink: {
                  name: 'Attempt'
                  type: 'Byte'
                }
              }
              {
                source: {
                  path: 'timeSpent'
                }
                sink: {
                  name: 'timeSpent'
                  type: 'Int16'
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
            referenceName: 'CourseActivityViewsEndPoint'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'courseActivityViews?page={pagina}&page_size=5000&update_start_date=@{variables(\'NextRunPipelineDate\')}'
                type: 'Expression'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'CourseActivityViewsTable'
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
