param pipelineName string

@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource general_pl 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: pipelineName
  parent: dataFactory
  properties: {
    activities: [
      {
        name: 'Extract_load - Usuarios'
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
              name: 'Copy_data_position'
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
                      'PositionID'
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
                        path: 'PositionID'
                      }
                      sink: {
                        name: 'PositionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'PositionName'
                      }
                      sink: {
                        name: 'PositionName'
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
                      value: 'positions?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'positions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_userlabels'
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
                      'UserLabelID'
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
                        path: 'UserLabelID'
                      }
                      sink: {
                        name: 'UserLabelID'
                        type: 'Int64'
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
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'LabelID'
                      }
                      sink: {
                        name: 'LabelID'
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
                      value: 'userlabels?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'userlabels_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_labels'
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
                      'LabelID'
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
                        path: 'LabelID'
                      }
                      sink: {
                        name: 'LabelID'
                        type: 'Int64'
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
                        path: 'LabelName'
                      }
                      sink: {
                        name: 'LabelName'
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
                      value: 'labels?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'labels_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_occupationareas'
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
                      'OccupationAreaID'
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
                        path: 'OccupationAreaID'
                      }
                      sink: {
                        name: 'OccupationAreaID'
                        type: 'Int64'
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
                        path: 'OccupationAreaName'
                      }
                      sink: {
                        name: 'OccupationAreaName'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'IsManager'
                      }
                      sink: {
                        name: 'IsManager'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'OccupationAreaStatusID'
                      }
                      sink: {
                        name: 'OccupationAreaStatusID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'OccupationAreaStatus_Identifier'
                      }
                      sink: {
                        name: 'OccupationAreaStatus_Identifier'
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
                      value: 'occupationareas?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'occupationareas_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_businessunits'
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
                      'BusinessUnitID'
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
                        path: 'BusinessUnitID'
                      }
                      sink: {
                        name: 'BusinessUnitID'
                        type: 'Int64'
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
                        path: 'BusinessUnitName'
                      }
                      sink: {
                        name: 'BusinessUnitName'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'BusinessUnitTypeID'
                      }
                      sink: {
                        name: 'BusinessUnitTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'BusinessUnitType_Identifier'
                      }
                      sink: {
                        name: 'BusinessUnitType_Identifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'BusinessUnitStatusID'
                      }
                      sink: {
                        name: 'BusinessUnitStatusID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'BusinessUnitStatus_Identifier'
                      }
                      sink: {
                        name: 'BusinessUnitStatus_Identifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'ParentBusinessUnitID'
                      }
                      sink: {
                        name: 'ParentBusinessUnitID'
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
                      value: 'businessunits?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'businessunits_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_userbusinessunits'
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
                      'UserBusinessUnitID'
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
                        path: 'UserBusinessUnitID'
                      }
                      sink: {
                        name: 'UserBusinessUnitID'
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
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'BusinessUnitID'
                      }
                      sink: {
                        name: 'BusinessUnitID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'OccupationAreaID'
                      }
                      sink: {
                        name: 'OccupationAreaID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'MonitorIndirectSubordinates'
                      }
                      sink: {
                        name: 'MonitorIndirectSubordinates'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'DirectSuperiorID'
                      }
                      sink: {
                        name: 'DirectSuperiorID'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'PositionID'
                      }
                      sink: {
                        name: 'PositionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'AdmissionDate'
                      }
                      sink: {
                        name: 'AdmissionDate'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'DismissalDate'
                      }
                      sink: {
                        name: 'DismissalDate'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'RegistrationNumber'
                      }
                      sink: {
                        name: 'RegistrationNumber'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'IsActive'
                      }
                      sink: {
                        name: 'IsActive'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'StateID'
                      }
                      sink: {
                        name: 'StateID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'State_Identifier'
                      }
                      sink: {
                        name: 'State_Identifier'
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
                      value: 'userbusinessunits?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'userbusinessunits_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_users'
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
                      'UserID'
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
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
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
                        path: 'FirstName'
                      }
                      sink: {
                        name: 'FirstName'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'LastName'
                      }
                      sink: {
                        name: 'LastName'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Login'
                      }
                      sink: {
                        name: 'Login'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'CPF'
                      }
                      sink: {
                        name: 'CPF'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'RG'
                      }
                      sink: {
                        name: 'RG'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Email'
                      }
                      sink: {
                        name: 'Email'
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
                        path: 'LastLogin'
                      }
                      sink: {
                        name: 'LastLogin'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'RegisterOriginTypeID'
                      }
                      sink: {
                        name: 'RegisterOriginTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'RegisterOriginType_Identifier'
                      }
                      sink: {
                        name: 'RegisterOriginType_Identifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'TermsOfUseAcceptance'
                      }
                      sink: {
                        name: 'TermsOfUseAcceptance'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'DefaultPictureURL'
                      }
                      sink: {
                        name: 'DefaultPictureURL'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Suspension_IsActive'
                      }
                      sink: {
                        name: 'Suspension_IsActive'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Suspension_Motive'
                      }
                      sink: {
                        name: 'Suspension_Motive'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Suspension_Feedback'
                      }
                      sink: {
                        name: 'Suspension_Feedback'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Suspension_StartDate'
                      }
                      sink: {
                        name: 'Suspension_StartDate'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Suspension_ExpirationDate'
                      }
                      sink: {
                        name: 'Suspension_ExpirationDate'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Suspension_AuditLastUpdatedDate'
                      }
                      sink: {
                        name: 'Suspension_AuditLastUpdatedDate'
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
                      value: 'users?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'users_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_useraccesshistorys'
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
                      'UserID'
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
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Device'
                      }
                      sink: {
                        name: 'Device'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'AuditCreatedDate'
                      }
                      sink: {
                        name: 'AuditCreatedDate'
                      }
                    }
                    {
                      source: {
                        path: 'BusinessUnitLinks'
                      }
                      sink: {
                        name: 'BusinessUnitLinks'
                      }
                    }
                    {
                      source: {
                        path: 'Identifier'
                      }
                      sink: {
                        name: 'Identifier'
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
                      value: 'useraccesshistorys?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'useraccesshistorys_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - Tags'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_load - Usuarios'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_Tags'
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
                      'TagID'
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
                        path: 'TagID'
                      }
                      sink: {
                        name: 'TagID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'TagName'
                      }
                      sink: {
                        name: 'TagName'
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
                      value: 'tags?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'tags_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_CourseTags'
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
                      'TagID'
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
                        path: 'TagID'
                      }
                      sink: {
                        name: 'TagID'
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
                      value: 'coursetags?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'coursetags_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_enrollabletags'
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
                      'tagid'
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
                        path: 'TagID'
                      }
                      sink: {
                        name: 'TagID'
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
                      value: 'enrollabletags?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'enrollabletags_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - Categories'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_Load - Tags'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_Coursecategories'
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
                      'CourseCategoryID'
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
                        path: 'CourseCategoryID'
                      }
                      sink: {
                        name: 'CourseCategoryID'
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
                        path: 'CategoryID'
                      }
                      sink: {
                        name: 'CategoryID'
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
                      value: 'coursecategories?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'coursecategories_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Categories'
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
                      'CategoryID'
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
                        path: 'CategoryID'
                      }
                      sink: {
                        name: 'CategoryID'
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
                        path: 'CategoryName'
                      }
                      sink: {
                        name: 'CategoryName'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'CategoryTypeID'
                      }
                      sink: {
                        name: 'CategoryTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'CategoryTypeIdentifier'
                      }
                      sink: {
                        name: 'CategoryTypeIdentifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'ParentCategoryID'
                      }
                      sink: {
                        name: 'ParentCategoryID'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'categories?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'categories_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - Campanhas'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_Load - Categories'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_Campaigns'
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
                      'CampaignID'
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
                        path: 'CampaignID'
                      }
                      sink: {
                        name: 'CampaignID'
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
                        path: 'CampaignName'
                      }
                      sink: {
                        name: 'CampaignName'
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
                        path: 'IsActive'
                      }
                      sink: {
                        name: 'IsActive'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'CampaignContentID'
                      }
                      sink: {
                        name: 'CampaignContentID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'ContentName'
                      }
                      sink: {
                        name: 'ContentName'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'ContentTypeID'
                      }
                      sink: {
                        name: 'ContentTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'CampaignContentTypeIdentifier'
                      }
                      sink: {
                        name: 'CampaignContentTypeIdentifier'
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
                      value: 'campaigns?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'campaigns_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Campaigncontents'
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
                      'CampaignRepositoryContentID'
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
                        path: 'CampaignRepositoryContentID'
                      }
                      sink: {
                        name: 'CampaignRepositoryContentID'
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
                        path: 'CampaignContentID'
                      }
                      sink: {
                        name: 'CampaignContentID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'RepositoryContentName'
                      }
                      sink: {
                        name: 'RepositoryContentName'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Size'
                      }
                      sink: {
                        name: 'Size'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'IsTrash'
                      }
                      sink: {
                        name: 'IsTrash'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'FullPath'
                      }
                      sink: {
                        name: 'FullPath'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'CampaignContentTypeID'
                      }
                      sink: {
                        name: 'CampaignContentTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'CampaignContentTypeIdentifier'
                      }
                      sink: {
                        name: 'CampaignContentTypeIdentifier'
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
                      value: 'campaigncontents?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'campaigncontents_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Campaignpermissions'
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
                      'CampaignPermissionID'
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
                        path: 'CampaignPermissionID'
                      }
                      sink: {
                        name: 'CampaignPermissionID'
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
                        path: 'CampaignID'
                      }
                      sink: {
                        name: 'CampaignID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'OccupationAreaID'
                      }
                      sink: {
                        name: 'OccupationAreaID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'BusinessUnitID'
                      }
                      sink: {
                        name: 'BusinessUnitID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Inheritable'
                      }
                      sink: {
                        name: 'Inheritable'
                        type: 'Boolean'
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
                      value: 'campaignpermissions?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'campaignpermissions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - Mediateca'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_Load - Campanhas'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_MediaLibraryPermissions'
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
                      'MediaContentPermissionID'
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
                        path: 'MediaContentPermissionID'
                      }
                      sink: {
                        name: 'MediaContentPermissionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'MediaContentID'
                      }
                      sink: {
                        name: 'MediaContentID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'ModuleContentTypeID'
                      }
                      sink: {
                        name: 'ModuleContentTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'ModuleContentType_Identifier'
                      }
                      sink: {
                        name: 'ModuleContentType_Identifier'
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
                      value: 'medialibrarypermissions?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'medialibrarypermissions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_VideoViews'
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
                      'VideoAccessHistoryID'
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
                        path: 'VideoAccessHistoryID'
                      }
                      sink: {
                        name: 'VideoAccessHistoryID'
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
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'VideoID'
                      }
                      sink: {
                        name: 'VideoID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'AccessDate'
                      }
                      sink: {
                        name: 'AccessDate'
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
                      value: 'videoviews?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'videoviews_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_MediaLibraryVideos'
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
                      'MediaContentID'
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
                        path: 'MediaContentID'
                      }
                      sink: {
                        name: 'MediaContentID'
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
                        path: 'CategoryID'
                      }
                      sink: {
                        name: 'CategoryID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Media_Name'
                      }
                      sink: {
                        name: 'Media_Name'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'VideoID'
                      }
                      sink: {
                        name: 'VideoID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'IsEnabled'
                      }
                      sink: {
                        name: 'IsEnabled'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'DisplayDate'
                      }
                      sink: {
                        name: 'DisplayDate'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Points'
                      }
                      sink: {
                        name: 'Points'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'medialibraryvideos?page={pagina}'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'medialibraryvideos_tb'
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
