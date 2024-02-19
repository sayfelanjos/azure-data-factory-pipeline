param dataFactoryName string

var pipelineName = 'CopyWebMeetingsDataWithCustomDatePipeline'

resource webmeeting_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
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
              interimSchemaName: 'VideoConference'
              keys: [
                'WebMeetingID'
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
                  path: 'WebMeetingID'
                }
                sink: {
                  name: 'WebMeetingID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'WebMeetingActivityID'
                }
                sink: {
                  name: 'WebMeetingActivityID'
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
                  path: 'IsDeleted'
                }
                sink: {
                  name: 'IsDeleted'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'Title'
                }
                sink: {
                  name: 'Title'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'StartDate'
                }
                sink: {
                  name: 'StartDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'EndDate'
                }
                sink: {
                  name: 'EndDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'type'
                }
                sink: {
                  name: 'type'
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
            referenceName: 'WebMeetingsEndPoint'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'webmeetings?page={pagina}&page_size=5000&update_start_date=@{pipeline().globalParameters.NewRunPipelineDateGlobalVariable}'
                type: 'Expression'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'WebMeetingsTable'
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
