param dataFactoryName string

var pipelineName = 'copy_data_componentactivities_pl'

resource componentactivities_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
          retry: 5
          retryIntervalInSeconds: 30
          secureOutput: false
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          source: {
            type: 'RestSource'
            httpRequestTimeout: '00:10:00'
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
              interimSchemaName: 'neolude'
              keys: [
                'ComponentActivityID'
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
                  path: 'ComponentActivityID'
                }
                sink: {
                  name: 'ComponentActivityID'
                  type: 'Int64'
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
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'ModuleActivityID'
                }
                sink: {
                  name: 'ModuleActivityID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'ModuleActivityTypeID'
                }
                sink: {
                  name: 'ModuleActivityTypeID'
                  type: 'Int64'
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
                  type: 'Int64'
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
                  type: 'Int64'
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
                  type: 'Int64'
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
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'VisibilityEnding'
                }
                sink: {
                  name: 'VisibilityEnding'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'VisibilityHoldDays'
                }
                sink: {
                  name: 'VisibilityHoldDays'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'VisibilityAvailableDays'
                }
                sink: {
                  name: 'VisibilityAvailableDays'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'ComponentID'
                }
                sink: {
                  name: 'ComponentID'
                  type: 'Int64'
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
                  type: 'Int64'
                }
              }
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
                  path: 'CourseID'
                }
                sink: {
                  name: 'CourseID'
                  type: 'Int64'
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
            referenceName: 'componentactivities_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'componentactivities_tb'
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
