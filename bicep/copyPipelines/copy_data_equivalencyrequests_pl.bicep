param dataFactoryName string
param updateStartDate string

var pipelineName = 'copy_data_equivalencyrequests_pl'

resource equivalencyrequests_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              interimSchemaName: 'Courses'
              keys: [
                'CourseEquivalencyRequestID'
              ]
            }
            sqlWriterUseTableLock: true

            disableMetricsCollection: false
          }
          translator: {
            type: 'TabularTranslator'
            // dataConversionSettings: {
            //   allowDataTruncation: true
            //   treatBooleanAsNumber: true
            //   dateTimeFormat: 'yyyy-MM-dd HH:mm:ss.fff'
            //   dateTimeOffsetFormat: 'yyyy-MM-dd HH:mm:ss.fff zzz'
            //   timeSpanFormat: 'dd\.hh\:mm'
            //   culture: 'en-us'

            // }
            mappings: [
              {
                source: {
                  path: 'CourseEquivalencyRequestID'
                }
                sink: {
                  name: 'CourseEquivalencyRequestID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'RequestedCourseID'
                }
                sink: {
                  name: 'RequestedCourseID'
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
                  path: 'RequesterUserID'
                }
                sink: {
                  name: 'RequesterUserID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'RequestCreatedDate'
                }
                sink: {
                  name: 'RequestCreatedDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'Course'
                }
                sink: {
                  name: 'Course'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Institution'
                }
                sink: {
                  name: 'Institution'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Description'
                }
                sink: {
                  name: 'Description'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Duration'
                }
                sink: {
                  name: 'Duration'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'Notes'
                }
                sink: {
                  name: 'Notes'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'ExpirationDate'
                }
                sink: {
                  name: 'ExpirationDate'
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
                  path: 'Status'
                }
                sink: {
                  name: 'Status'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'LastActionUserID'
                }
                sink: {
                  name: 'LastActionUserID'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'LastActionDate'
                }
                sink: {
                  name: 'LastActionDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'Feedback'
                }
                sink: {
                  name: 'Feedback'
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
                  path: 'IsDeleted'
                }
                sink: {
                  name: 'IsDeleted'
                  type: 'Boolean'
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
            referenceName: 'equivalencyrequests_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: 'equivalencyrequests?page={pagina}&page_size=5000&update_start_date=${updateStartDate}'
              type: 'string'
            }
          }
        ]
        outputs: [
          {
            referenceName: 'equivalencyrequests_tb'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    annotations: []
    folder: {
      name: 'CopyDataPipelines'
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
