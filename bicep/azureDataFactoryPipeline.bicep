param resourceGroupName string = resourceGroup().name
var dataFactoryName = '${resourceGroupName}-data-factory'
var dataFactoryDataSetInName = '${resourceGroupName}-data-source'
var dataFactoryDataSetOutName = '${resourceGroupName}-data-destination'
var pipelineName = 'from-rest-to-sql-server-pipeline'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource dataFactoryDataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: dataFactoryDataSetInName
}

resource dataFactoryDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' existing = {
  name: dataFactoryDataSetOutName
}

resource dataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  parent: dataFactory
  name: pipelineName
  properties: {
    activities: [
      {
        name: 'CopyFromRestToSQLDatabase'
        type: 'Copy'
        typeProperties: {
          source: {
            type: 'RestSource'
            httpRequestTimeout: '00:01:40'
            paginationRules: any({
              'AbsoluteUrl.{pagina}': 'RANGE:1:9999:1'
              'EndCondition:$[\'data\']': 'Empty'
            })
            requestInterval: '00.00:00:00.010'
            requestMethod: 'GET'
          }
          sink: {
            type: 'AzureSqlSink'
            preCopyScript: 'truncate table [neolude].[dbo.coursepermissions]'
            writeBehavior: 'insert'
            sqlWriterUseTableLock: 'true'
            tableOption: 'autoCreate'
            disableMetricsCollection: false
          }
          enableStaging: false
          translator: any(
            {
              type: 'TabularTranslator'
              mappings: [
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
                    path: 'CourseID'
                  }
                  sink: {
                    name: 'CourseID'
                    type: 'Int64'
                  }
                }
                {
                  source: {
                    path: 'CoursePermissionLevelID'
                  }
                  sink: {
                    name: 'CoursePermissionLevelID'
                    type: 'Int64'
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
          )
        }
        inputs: [
          {
            referenceName: dataFactoryDataSetIn.name
            type: 'DatasetReference'
            parameters: {
              SetApiName: {
                value: 'coursepermissions?page={pagina}&page_size=5000&maximumpagesize=5000&update_start_date=2022-01-01'
                type: 'Expression'
              }
            }
          }
        ]
        outputs: [
          {
            referenceName: dataFactoryDataSetOut.name
            type: 'DatasetReference'
          }
        ]
      }
    ]
    folder: {
      name: 'Neolude'
    }
  }
}
