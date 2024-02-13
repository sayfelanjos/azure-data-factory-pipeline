param dataFactoryName string
param updateStartDate string
var pipelineName = 'copy_data_businessunits_pl'

resource businessunits_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              interimSchemaName: 'Users'
              keys: [
                'BusinessUnitID'
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
                  path: 'BusinessUnitID'
                }
                sink: {
                  name: 'BusinessUnitID'
                  type: 'Int32'
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
                  type: 'Int32'
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
                  type: 'Int32'
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
            referenceName: 'businessunits_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'businessunits?page={pagina}&page_size=5000&${updateStartDate}'
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
