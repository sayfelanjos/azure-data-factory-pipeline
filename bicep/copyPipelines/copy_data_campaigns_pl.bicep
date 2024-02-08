param dataFactoryName string

var pipelineName = 'copy_data_campaigns_pl'

resource campaigns_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              interimSchemaName: 'Campaigns'
              keys: [
                'CampaignID'
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
                  path: 'CampaignID'
                }
                sink: {
                  name: 'CampaignID'
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
                  type: 'Datetime'
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
                  type: 'Int32'
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
                  type: 'Int32'
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
            referenceName: 'campaigns_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'campaigns_tb'
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
