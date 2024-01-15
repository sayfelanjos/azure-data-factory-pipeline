@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource sqlDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'scorms_tb'
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
            table: 'scorms'
            schema: 'neolude'
        }
        folder: {
            name: 'sql_tables'
        }
    }
}
