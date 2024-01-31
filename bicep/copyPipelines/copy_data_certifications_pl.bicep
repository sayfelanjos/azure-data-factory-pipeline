param dataFactoryName string

var pipelineName = 'copy_data_certifications_pl'

resource certifications_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
                'CertificationID'
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
                  path: 'CertificationID'
                }
                sink: {
                  name: 'CertificationID'
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
                  path: 'Description'
                }
                sink: {
                  name: 'Description'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'ExpirationType'
                }
                sink: {
                  name: 'ExpirationType'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'ExpirationValue'
                }
                sink: {
                  name: 'ExpirationValue'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'DaysBeforeRenewal'
                }
                sink: {
                  name: 'DaysBeforeRenewal'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'UseCoursePermission'
                }
                sink: {
                  name: 'UseCoursePermission'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'AllowCustomExpirationDate'
                }
                sink: {
                  name: 'AllowCustomExpirationDate'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'CertificationStatusID'
                }
                sink: {
                  name: 'CertificationStatusID'
                  type: 'Int64'
                }
              }
              {
                source: {
                  path: 'CertificationStatusIdentifier'
                }
                sink: {
                  name: 'CertificationStatusIdentifier'
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
            referenceName: 'certifications_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                type: 'Expression'
                value: 'certifications?page={pagina}&page_size=5000'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: 'certifications_tb'
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
