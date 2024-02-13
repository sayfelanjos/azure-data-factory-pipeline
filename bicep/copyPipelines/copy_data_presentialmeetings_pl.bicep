param dataFactoryName string
param updateStartDate string

var pipelineName = 'copy_data_presentialmeetings_pl'

resource presentialmeetings_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              interimSchemaName: 'PresentialMeetings'
              keys: [
                'PresentialMeetingID'
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
                  path: 'PresentialMeetingID'
                }
                sink: {
                  name: 'PresentialMeetingID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'PresentialMeetingActivityID'
                }
                sink: {
                  name: 'PresentialMeetingActivityID'
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
                  path: 'Name'
                }
                sink: {
                  name: 'Name'
                  type: 'String'
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
                  type: 'Datetime'
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
                  path: 'PlaceName'
                }
                sink: {
                  name: 'PlaceName'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'PlaceCity'
                }
                sink: {
                  name: 'PlaceCity'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'PlaceState'
                }
                sink: {
                  name: 'PlaceState'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'PlaceCountry'
                }
                sink: {
                  name: 'PlaceCountry'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'PlaceRoomID'
                }
                sink: {
                  name: 'PlaceRoomID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'PlaceRoom'
                }
                sink: {
                  name: 'PlaceRoom'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'PlaceRoomCapacity'
                }
                sink: {
                  name: 'PlaceRoomCapacity'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'PlaceRoomHasAccessibility'
                }
                sink: {
                  name: 'PlaceRoomHasAccessibility'
                  type: 'Boolean'
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
            referenceName: 'presentialmeetings_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'presentialmeetings?page={pagina}&page_size=5000&${update_start_date}'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'presentialmeetings_tb'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    annotations: []
    folder: {
      name: 'CopyPipelines'
    }
    parameters: {}
    runDimensions: {}
    variables: {}

  }
}
