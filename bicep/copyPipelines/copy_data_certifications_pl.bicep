param dataFactoryName string
param updateStartDate string
var pipelineName = 'copy_data_certifications_pl'

resource certifications_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'SetNextRunPipelineDate'
        type: 'SetVariable'
        dependsOn: []
        policy: {
          secureInput: false
          secureOutput: false
        }
        userProperties: []
        typeProperties: {
          variableName: 'NextRunPipelineDate'
          value: {
            value: '@{formatDateTime(adddays(convertFromUtc(utcnow(), \'E. South America Standard Time\'), -1), \'yyyy-MM-dd 02:00:00.000\')}'
            type: 'Expression'
          }
        }
      }
      {
        name: 'OneToOneCopyPipeline'
        description: 'Copy data from rest api to sql database table'
        type: 'Copy'
        dependsOn: [
          {
            activity: 'SetNextRunPipelineDate'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
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
              interimSchemaName: 'Certifications'
              keys: [
                'CertificationID'
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
                  path: 'CertificationID'
                }
                sink: {
                  name: 'CertificationID'
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
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'DaysBeforeRenewal'
                }
                sink: {
                  name: 'DaysBeforeRenewal'
                  type: 'Int16'
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
                  type: 'Int32'
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
            referenceName: 'certifications_ep'
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'certifications?page={pagina}&page_size=5000&update_start_date=${updateStartDate}'
                type: 'Expression'
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
      name: 'CopyPipelines'
    }
    parameters: {}
    runDimensions: {}
    variables: {
      NextRunPipelineDate: {
        type: 'String'
      }
    }
  }
}
