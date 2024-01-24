@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource dataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'campaigns_tb'
    parent: dataFactory
    properties: {
        annotations: []
        type: 'AzureSqlTable'
        linkedServiceName: {
            referenceName: 'sqldb-linked-service'
            type: 'LinkedServiceReference'
        }
        schema: []
        typeProperties: {
            table: 'campaigns'
            schema: 'neolude'
        }
        folder: {
            name: 'sql_tables'
        }
    }
}
