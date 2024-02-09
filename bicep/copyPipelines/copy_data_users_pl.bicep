param dataFactoryName string

var pipelineName = 'copy_data_users_pl'

resource users_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
          retryIntervalInSeconds: 60
          secureOutput: false
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          source: {
            type: 'RestSource'
            httpRequestTimeout: '00:05:00'
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
                'UserID'
              ]
            }
            sqlWriterUseTableLock: true
            tableOption: 'None'
            disableMetricsCollection: false
          }
          translator: {
            type: 'TabularTranslator'
            mappings: [
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
                  path: 'BirthDate'
                }
                sink: {
                  name: 'BirthDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'GenderIdentifier'
                }
                sink: {
                  name: 'GenderIdentifier'
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
                  path: 'LastLogin'
                }
                sink: {
                  name: 'LastLogin'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'RegisterOriginTypeID'
                }
                sink: {
                  name: 'RegisterOriginTypeID'
                  type: 'Int32'
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
                  type: 'Int16'
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
                  type: 'Boolean'
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
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'Suspension_ExpirationDate'
                }
                sink: {
                  name: 'Suspension_ExpirationDate'
                  type: 'Datetime'
                }
              }
              {
                source: {
                  path: 'Suspension_AuditLastUpdatedDate'
                }
                sink: {
                  name: 'Suspension_AuditLastUpdatedDate'
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
            referenceName: 'users_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'users_tb'
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
