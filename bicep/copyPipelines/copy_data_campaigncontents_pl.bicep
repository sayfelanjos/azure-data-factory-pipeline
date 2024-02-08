param dataFactoryName string

var pipelineName = 'copy_data_campaigncontents_pl'

resource campaigcontents_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
                'CampaignRepositoryContentID'
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
                  path: 'CampaignRepositoryContentID'
                }
                sink: {
                  name: 'CampaignRepositoryContentID'
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
                  path: 'CampaignContentID'
                }
                sink: {
                  name: 'CampaignContentID'
                  type: 'Int32'
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
            referenceName: 'campaigncontents_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                type: 'Expression'
                value: 'campaigncontents?page={pagina}&page_size=5000&update_start_date=2022-01-01'
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
