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
            httpRequestTimeout: '00:05:00'
            requestInterval: '00.00:01:00'
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
              interimSchemaName: 'neolude'
              keys: [
                'OccupationAreaID'
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
            referenceName: 'occupationareas_ep'
            type: 'DatasetReference'
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
