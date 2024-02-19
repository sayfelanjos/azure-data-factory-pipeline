@description('Data Factory Name')
param azureDataFactoryName string

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: azureDataFactoryName
}

resource dataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'UserAccessHistorysTable'
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
            table: 'UserAccessHistorys'
            schema: 'Users'
        }
        folder: {
            name: 'Tables'
        }
    }
}
