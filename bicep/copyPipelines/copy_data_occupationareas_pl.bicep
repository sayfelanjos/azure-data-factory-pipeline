param dataFactoryName string

var pipelineName = 'copy_data_occupationareas_pl'

resource occupationareas_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
          retry: 2
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
                'OccupationAreaID'
              ]
            }
            sqlWriterUseTableLock: true
            tableOption: 'none'
            disableMetricsCollection: false
          }
          translator: {
            type: 'TabularTranslator'
            mappings: [
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
                  type: 'Int32'
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
            referenceName: 'occupationareas_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                type: 'Expression'
                value: 'occupationareas?page={pagina}&page_size=5000&update_start_date=2022-01-01'
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
