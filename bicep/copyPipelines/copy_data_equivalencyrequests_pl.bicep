param dataFactoryName string

var pipelineName = 'copy_data_equivalencyrequests_pl'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'OneToOneCopyPipeline'
        description: 'Copy data from rest api to sql database table'
        type: 'Copy'
        dependsOn: []
        policy: {
          timeout: '0.12:00:00'
          retry: 0
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
              'EndCondition:$[\'data\']': 'Empty'
            }
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'upsert'
            upsertSettings: {
              useTempDB: true
              keys: [
                'CourseEquivalencyRequestID'
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
                  path: 'CourseEquivalencyRequestID'
                }
                sink: {
                  name: 'CourseEquivalencyRequestID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'RequestedCourseID'
                }
                sink: {
                  name: 'RequestedCourseID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'EnrollmentID'
                }
                sink: {
                  name: 'EnrollmentID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'RequesterUserID'
                }
                sink: {
                  name: 'RequesterUserID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'RequestCreatedDate'
                }
                sink: {
                  name: 'RequestCreatedDate'
                  type: 'String'
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
                  type: 'Int64'
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
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'ConclusionDate'
                }
                sink: {
                  name: 'ConclusionDate'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Status'
                }
                sink: {
                  name: 'Status'
                  type: 'Int64'
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
                  type: 'String'
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
            referenceName: 'equivalencyrequests_ep'
            type: 'DatasetReference'
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
      name: 'one_to_one_copy_pl'
    }
    parameters: {}
    runDimensions: {}
    variables: {}
  }
}
