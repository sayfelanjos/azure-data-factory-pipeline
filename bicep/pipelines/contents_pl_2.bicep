param pipelineName string

@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource contents_pl_2 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: pipelineName
  parent: dataFactory
  properties: {
    activities: [
      {
        name: 'Extract_Load - New_Apis'
        type: 'ForEach'
        dependsOn: []
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_Scorms'
              description: ''
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'ScormID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'ScormID'
                      }
                      sink: {
                        name: 'ScormID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'ScormActivityID'
                      }
                      sink: {
                        name: 'ScormActivityID'
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
                        path: 'Title'
                      }
                      sink: {
                        name: 'Title'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Version'
                      }
                      sink: {
                        name: 'Version'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'gradeType'
                      }
                      sink: {
                        name: 'gradeType'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'keepGradeType'
                      }
                      sink: {
                        name: 'keepGradeType'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'AllowMultipleAttempts'
                      }
                      sink: {
                        name: 'AllowMultipleAttempts'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'AttemptsLimit'
                      }
                      sink: {
                        name: 'AttemptsLimit'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'LastUploadedFileInfo'
                      }
                      sink: {
                        name: 'LastUploadedFileInfo'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'scorms?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'scorms_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_PPT'
              description: ''
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'PresentationID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'PresentationID'
                      }
                      sink: {
                        name: 'PresentationID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'PresentationActivityID'
                      }
                      sink: {
                        name: 'PresentationActivityID'
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
                        path: 'Title'
                      }
                      sink: {
                        name: 'Title'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'SlideCount'
                      }
                      sink: {
                        name: 'SlideCount'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'LastUploadedFileInfo'
                      }
                      sink: {
                        name: 'LastUploadedFileInfo'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'ppts?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'ppts_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_presentialmeetings'
              description: ''
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'PresentialMeetingID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'presentialmeetings?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
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
            {
              name: 'Copy_data_webmeeting'
              description: ''
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'WebMeetingID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'WebMeetingID'
                      }
                      sink: {
                        name: 'WebMeetingID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'WebMeetingActivityID'
                      }
                      sink: {
                        name: 'WebMeetingActivityID'
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
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'EndDate'
                      }
                      sink: {
                        name: 'EndDate'
                        type: 'String'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'webmeetings?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'webmeetings_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_uploadactivities'
              description: ''
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'FileAssignmentID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'FileAssignmentID'
                      }
                      sink: {
                        name: 'FileAssignmentID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'FileAssignmentUploadActivityID'
                      }
                      sink: {
                        name: 'FileAssignmentUploadActivityID'
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
                        path: 'Title'
                      }
                      sink: {
                        name: 'Title'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'uploadactivities?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'uploadactivities_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Audios'
              description: ''
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'AudioID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'AudioID'
                      }
                      sink: {
                        name: 'AudioID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'AudioActivityID'
                      }
                      sink: {
                        name: 'AudioActivityID'
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
                        path: 'Title'
                      }
                      sink: {
                        name: 'Title'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'audios?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'audios_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
    ]
    annotations: []
  }
}
