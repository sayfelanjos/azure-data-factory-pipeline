param dataFactoryName string

var pipelineName = 'copy_data_scorms_pl'

resource scorms_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
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
              'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
              'EndCondition:$[\'data\']': 'Empty'
            }
          }
          sink: {
            type: 'AzureSqlSink'
            writeBehavior: 'upsert'
            upsertSettings: {
              useTempDB: false
              interimSchemaName: 'Scorms'
              keys: [
                'ScormID'
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
                  path: 'ScormID'
                }
                sink: {
                  name: 'ScormID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'ScormActivityID'
                }
                sink: {
                  name: 'ScormActivityID'
                  type: 'Int32'
                }
              }
              {
                source: {
                  path: 'ModuleActivityTypeID'
                }
                sink: {
                  name: 'ModuleActivityTypeID'
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
                  path: 'Title'
                }
                sink: {
                  name: 'Title'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'Version'
                }
                sink: {
                  name: 'Version'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'gradeType'
                }
                sink: {
                  name: 'gradeType'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'keepGradeType'
                }
                sink: {
                  name: 'keepGradeType'
                  type: 'String'
                }
              }
              {
                source: {
                  path: 'AllowMultipleAttempts'
                }
                sink: {
                  name: 'AllowMultipleAttempts'
                  type: 'Boolean'
                }
              }
              {
                source: {
                  path: 'AttemptsLimit'
                }
                sink: {
                  name: 'AttemptsLimit'
                  type: 'Int16'
                }
              }
              {
                source: {
                  path: 'LastUploadedFileInfo'
                }
                sink: {
                  name: 'LastUploadedFileInfo'
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
            referenceName: 'scorms_ep'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'scorms_tb'
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
