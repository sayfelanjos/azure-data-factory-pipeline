param pipelineName string 

@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource contents_pl 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: pipelineName
  parent: dataFactory
  properties: {
    activities: [
      {
        name: 'Extract_Load - Avaliacoes'
        type: 'ForEach'
        dependsOn: []
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_ExamTakenQuestions'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'ExamTakenQuestionID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'ExamTakenQuestionID'
                      }
                      sink: {
                        name: 'ExamTakenQuestionID'
                        type: 'Int64'
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
                        path: 'ExamTakenID'
                      }
                      sink: {
                        name: 'ExamTakenID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'QuestionID'
                      }
                      sink: {
                        name: 'QuestionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Order'
                      }
                      sink: {
                        name: 'Order'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Grade'
                      }
                      sink: {
                        name: 'Grade'
                        type: 'Double'
                      }
                    }
                    {
                      source: {
                        path: 'Points'
                      }
                      sink: {
                        name: 'Points'
                        type: 'Int64'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'examtakenquestions?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'examtakenquestions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_ExamTakens'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'ExamTakenID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'ExamTakenID'
                      }
                      sink: {
                        name: 'ExamTakenID'
                        type: 'Int64'
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
                        path: 'ExamID'
                      }
                      sink: {
                        name: 'ExamID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'EnrollmentID'
                      }
                      sink: {
                        name: 'EnrollmentID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Attempt'
                      }
                      sink: {
                        name: 'Attempt'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'TimeSpent'
                      }
                      sink: {
                        name: 'TimeSpent'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'NeedsGrading'
                      }
                      sink: {
                        name: 'NeedsGrading'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'Grade'
                      }
                      sink: {
                        name: 'Grade'
                        type: 'Double'
                      }
                    }
                    {
                      source: {
                        path: 'Finished'
                      }
                      sink: {
                        name: 'Finished'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'CompletionDate'
                      }
                      sink: {
                        name: 'CompletionDate'
                        type: 'DateTimeOffset'
                      }
                    }
                    {
                      source: {
                        path: 'Locked'
                      }
                      sink: {
                        name: 'Locked'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'CreatedByLock'
                      }
                      sink: {
                        name: 'CreatedByLock'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'examtakens?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'examtaken_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_ExamQuestions'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'ExamQuestionID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'ExamQuestionID'
                      }
                      sink: {
                        name: 'ExamQuestionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'ExamID'
                      }
                      sink: {
                        name: 'ExamID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'QuestionID'
                      }
                      sink: {
                        name: 'QuestionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Order'
                      }
                      sink: {
                        name: 'Order'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Points'
                      }
                      sink: {
                        name: 'Points'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'QuestionGroupID'
                      }
                      sink: {
                        name: 'QuestionGroupID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'QuestionGroup_Title'
                      }
                      sink: {
                        name: 'QuestionGroup_Title'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'examquestions?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'examquestions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Questions'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'QuestionID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'QuestionID'
                      }
                      sink: {
                        name: 'QuestionID'
                        type: 'Int64'
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
                        path: 'Question'
                      }
                      sink: {
                        name: 'Question'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'DifficultyLevel'
                      }
                      sink: {
                        name: 'DifficultyLevel'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Feedback'
                      }
                      sink: {
                        name: 'Feedback'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'HasAutoCorrection'
                      }
                      sink: {
                        name: 'HasAutoCorrection'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'QuestionTypeID'
                      }
                      sink: {
                        name: 'QuestionTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'QuestionType_Identifier'
                      }
                      sink: {
                        name: 'QuestionType_Identifier'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'questions?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'questions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Exams'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'ExamID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'ExamID'
                      }
                      sink: {
                        name: 'ExamID'
                        type: 'Int64'
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
                        path: 'FullPath'
                      }
                      sink: {
                        name: 'FullPath'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'AttemptsLimit'
                      }
                      sink: {
                        name: 'AttemptsLimit'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'DurationLimit'
                      }
                      sink: {
                        name: 'DurationLimit'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'KeepScoreTypeID'
                      }
                      sink: {
                        name: 'KeepScoreTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'KeepScoreType_Identifier'
                      }
                      sink: {
                        name: 'KeepScoreType_Identifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'ExamTypeID'
                      }
                      sink: {
                        name: 'ExamTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'ExamType_Identifier'
                      }
                      sink: {
                        name: 'ExamType_Identifier'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'exams?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'exams_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - PaginasHTML'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_Load - Avaliacoes'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_MediaLibraryHtmlViews'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'AccessHistoryID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'AccessHistoryID'
                      }
                      sink: {
                        name: 'AccessHistoryID'
                        type: 'Int64'
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
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'HTMLPageID'
                      }
                      sink: {
                        name: 'HTMLPageID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'AccessDate'
                      }
                      sink: {
                        name: 'AccessDate'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'medialibraryhtmlviews?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'medialibraryhtmlviews_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_MediaLibraryHtml'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'MediaContentID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'MediaContentID'
                      }
                      sink: {
                        name: 'MediaContentID'
                        type: 'Int64'
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
                        path: 'CategoryID'
                      }
                      sink: {
                        name: 'CategoryID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Media_Name'
                      }
                      sink: {
                        name: 'Media_Name'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'HTMLPageID'
                      }
                      sink: {
                        name: 'HTMLPageID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'IsEnabled'
                      }
                      sink: {
                        name: 'IsEnabled'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'DisplayDate'
                      }
                      sink: {
                        name: 'DisplayDate'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Points'
                      }
                      sink: {
                        name: 'Points'
                        type: 'Int64'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'medialibraryhtmls?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'medialibraryhtmls_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Htmls'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'HTMLPageID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'HTMLPageID'
                      }
                      sink: {
                        name: 'HTMLPageID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'ModuleActivityTypeID'
                      }
                      sink: {
                        name: 'ModuleActivityTypeID'
                        type: 'Int64'
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
                        path: 'FullPath'
                      }
                      sink: {
                        name: 'FullPath'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'htmls?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'htmls_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - Pesquisas'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_Load - PaginasHTML'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_Surveyanswers'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:122:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'SurveyAnswerID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'SurveyAnswerID'
                      }
                      sink: {
                        name: 'SurveyAnswerID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyID'
                      }
                      sink: {
                        name: 'SurveyID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'EnrollmentID'
                      }
                      sink: {
                        name: 'EnrollmentID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'EnrollableID'
                      }
                      sink: {
                        name: 'EnrollableID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'CourseID'
                      }
                      sink: {
                        name: 'CourseID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'CampaignID'
                      }
                      sink: {
                        name: 'CampaignID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SubmissionDate'
                      }
                      sink: {
                        name: 'SubmissionDate'
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
                        path: 'IsAnonymousAnswer'
                      }
                      sink: {
                        name: 'IsAnonymousAnswer'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'surveyanswers?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'surveyanswers_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_SurveyAnswerQuestions'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'SurveyQuestionAnswerID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'SurveyQuestionAnswerID'
                      }
                      sink: {
                        name: 'SurveyQuestionAnswerID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyAnswerID'
                      }
                      sink: {
                        name: 'SurveyAnswerID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyQuestionID'
                      }
                      sink: {
                        name: 'SurveyQuestionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyQuestionOptionID'
                      }
                      sink: {
                        name: 'SurveyQuestionOptionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Answer'
                      }
                      sink: {
                        name: 'Answer'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Justification'
                      }
                      sink: {
                        name: 'Justification'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'surveyanswerquestions?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'surveyanswerquestions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_SurveyQuestionOptions'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'SurveyQuestionOptionID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'SurveyQuestionOptionID'
                      }
                      sink: {
                        name: 'SurveyQuestionOptionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'QuestionID'
                      }
                      sink: {
                        name: 'QuestionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Label'
                      }
                      sink: {
                        name: 'Label'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Value'
                      }
                      sink: {
                        name: 'Value'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Order'
                      }
                      sink: {
                        name: 'Order'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'RequiresJustification'
                      }
                      sink: {
                        name: 'RequiresJustification'
                        type: 'Boolean'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'surveyquestionoptions?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'surveyquestionoptions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_SurveyQuestions'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'SurveyQuestionID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'SurveyQuestionID'
                      }
                      sink: {
                        name: 'SurveyQuestionID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'Question'
                      }
                      sink: {
                        name: 'Question'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyID'
                      }
                      sink: {
                        name: 'SurveyID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyOrder'
                      }
                      sink: {
                        name: 'SurveyOrder'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyQuestionTypeID'
                      }
                      sink: {
                        name: 'SurveyQuestionTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyQuestionType_Identifier'
                      }
                      sink: {
                        name: 'SurveyQuestionType_Identifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyQuestionType_HasOptions'
                      }
                      sink: {
                        name: 'SurveyQuestionType_HasOptions'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'GroupingID'
                      }
                      sink: {
                        name: 'GroupingID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyQuestionGrouping_Title'
                      }
                      sink: {
                        name: 'SurveyQuestionGrouping_Title'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'IsJustificationMandatory'
                      }
                      sink: {
                        name: 'IsJustificationMandatory'
                        type: 'Boolean'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'surveyquestions?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'surveyquestions_tb'
                  type: 'DatasetReference'
                }
              ]
            }
            {
              name: 'Copy_data_Surveys'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'SurveyID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'SurveyID'
                      }
                      sink: {
                        name: 'SurveyID'
                        type: 'Int64'
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
                        path: 'IsDeleted'
                      }
                      sink: {
                        name: 'IsDeleted'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'PrivacyLevel'
                      }
                      sink: {
                        name: 'PrivacyLevel'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyTypeID'
                      }
                      sink: {
                        name: 'SurveyTypeID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'SurveyType_Identifier'
                      }
                      sink: {
                        name: 'SurveyType_Identifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'CanResponseAfterEnrollablePeriod'
                      }
                      sink: {
                        name: 'CanResponseAfterEnrollablePeriod'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'surveys?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'surveys_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - Videos'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_Load - Pesquisas'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_Videos'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'VideoID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'VideoID'
                      }
                      sink: {
                        name: 'VideoID'
                        type: 'Double'
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
                        path: 'FullPath'
                      }
                      sink: {
                        name: 'FullPath'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'Duration'
                      }
                      sink: {
                        name: 'Duration'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'VideoStatusID'
                      }
                      sink: {
                        name: 'VideoStatusID'
                        type: 'Int64'
                      }
                    }
                    {
                      source: {
                        path: 'VideoStatus_Identifier'
                      }
                      sink: {
                        name: 'VideoStatus_Identifier'
                        type: 'String'
                      }
                    }
                    {
                      source: {
                        path: 'IsLive'
                      }
                      sink: {
                        name: 'IsLive'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'SeekEnabled'
                      }
                      sink: {
                        name: 'SeekEnabled'
                        type: 'Boolean'
                      }
                    }
                    {
                      source: {
                        path: 'IsExternal'
                      }
                      sink: {
                        name: 'IsExternal'
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
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'videos?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'videos_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
      {
        name: 'Extract_Load - Arquivos'
        type: 'ForEach'
        dependsOn: [
          {
            activity: 'Extract_Load - Videos'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          items: {
            value: '@createArray(1)'
            type: 'Expression'
          }
          isSequential: true
          activities: [
            {
              name: 'Copy_data_Downloads'
              description: ''
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '0.12:00:00'
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
                    'AbsoluteUrl.{pagina}': 'RANGE:1:1000:1'
                    'EndCondition:$[\'data\']': 'Empty'
                  }
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: 'upsert'
                  upsertSettings: {
                    useTempDB: true
                    keys: [
                      'DownloadHistoryID'
                    ]
                  }
                  sqlWriterUseTableLock: true
                  tableOption: 'autoCreate'
                  disableMetricsCollection: false
                }
                enableStaging: false
                translator: {
                  type: 'TabularTranslator'
                  mappings: [
                    {
                      source: {
                        path: 'DownloadHistoryID'
                      }
                      sink: {
                        name: 'DownloadHistoryID'
                      }
                    }
                    {
                      source: {
                        path: 'IsDeleted'
                      }
                      sink: {
                        name: 'IsDeleted'
                      }
                    }
                    {
                      source: {
                        path: 'FileAssignmentID'
                      }
                      sink: {
                        name: 'FileAssignmentID'
                      }
                    }
                    {
                      source: {
                        path: 'UserID'
                      }
                      sink: {
                        name: 'UserID'
                      }
                    }
                    {
                      source: {
                        path: 'FileName'
                      }
                      sink: {
                        name: 'FileName'
                      }
                    }
                    {
                      source: {
                        path: 'Title'
                      }
                      sink: {
                        name: 'Title'
                      }
                    }
                    {
                      source: {
                        path: 'Description'
                      }
                      sink: {
                        name: 'Description'
                      }
                    }
                    {
                      source: {
                        path: 'DownloadDate'
                      }
                      sink: {
                        name: 'DownloadDate'
                      }
                    }
                    {
                      source: {
                        path: 'AuditCreatedDate'
                      }
                      sink: {
                        name: 'AuditCreatedDate'
                      }
                    }
                    {
                      source: {
                        path: 'AuditLastUpdatedDate'
                      }
                      sink: {
                        name: 'AuditLastUpdatedDate'
                      }
                    }
                    {
                      source: {
                        path: '$[\'metadata\'][\'Page\']'
                      }
                      sink: {
                        name: 'Page'
                      }
                    }
                    {
                      source: {
                        path: '$[\'metadata\'][\'PageSize\']'
                      }
                      sink: {
                        name: 'PageSize'
                      }
                    }
                    {
                      source: {
                        path: '$[\'metadata\'][\'MaximumPageSize\']'
                      }
                      sink: {
                        name: 'MaximumPageSize'
                      }
                    }
                  ]
                  collectionReference: '$[\'data\']'
                  mapComplexValuesToString: true
                }
              }
              inputs: [
                {
                  referenceName: 'RestAPINeolude_ep'
                  type: 'DatasetReference'
                  parameters: {
                    SetApiName: {
                      value: 'medialibraryfiledownloads?page={pagina}&page_size=5000&update_start_date=2022-01-01'
                      type: 'Expression'
                    }
                  }
                }
              ]
              outputs: [
                {
                  referenceName: 'medialibraryfiledownloads_tb'
                  type: 'DatasetReference'
                }
              ]
            }
          ]
        }
      }
    ]
    annotations: []
  }
}
