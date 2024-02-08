param dataFactoryName string

var pipelineName = 'copy_data_userbusinessunits_pl'

resource userbusinessunits_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              useTempDB: false
              interimSchemaName: 'Users'
              keys: [
                'UserBusinessUnitID'
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
                  path: 'UserBusinessUnitID'
                }
                sink: {
                  name: 'UserBusinessUnitID'
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
                  path: 'UserID'
                }
                sink: {
                  name: 'UserID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'BusinessUnitID'
                }
                sink: {
                  name: 'BusinessUnitID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'OccupationAreaID'
                }
                sink: {
                  name: 'OccupationAreaID'
                  type: 'Int32'
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
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'PositionID'
                }
                sink: {
                  name: 'PositionID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'AdmissionDate'
                }
                sink: {
                  name: 'AdmissionDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'DismissalDate'
                }
                sink: {
                  name: 'DismissalDate'
                  type: 'Datetime'
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
                  type: 'Int32'
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
            referenceName: 'userbusinessunits_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'userbusinessunits_tb'
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
