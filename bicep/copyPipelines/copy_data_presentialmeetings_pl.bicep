param dataFactoryName string

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
          timeout: '2.00:00:00'
          retry: 4
          retryIntervalInSeconds: 180
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
              'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
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
                'PresentialMeetingID'
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
                  path: 'PresentialMeetingID'
                }
                sink: {
                  name: 'PresentialMeetingID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'PresentialMeetingActivityID'
                }
                sink: {
                  name: 'PresentialMeetingActivityID'
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
                  type: 'Int64'
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
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'PlaceRoomHasAccessibility'
                }
                sink: {
                  name: 'PlaceRoomHasAccessibility'
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
            referenceName: 'presentialmeetings_ep'
            type: 'DatasetReference'
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
      name: 'one_to_one_copy_pl'
    }
    parameters: {}
    runDimensions: {}
    variables: {}

  }
}
