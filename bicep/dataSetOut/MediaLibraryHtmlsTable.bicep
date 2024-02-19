@description('Data Factory Name')
param azureDataFactoryName string

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: azureDataFactoryName
}

resource dataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'MediaLibraryHtmlsTable'
    parent: azureDataFactory
    properties: {
        annotations: []
        type: 'AzureSqlTable'
        linkedServiceName: {
            referenceName: 'sqldb-linked-service'
            type: 'LinkedServiceReference'
        }
        schema: []
        typeProperties: {
            table: 'MediaLibraryHtmls'
            schema: 'Files'
        }
        folder: {
            name: 'Tables'
        }
    }
}
