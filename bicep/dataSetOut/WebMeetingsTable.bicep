@description('Data Factory Name')
param azureDataFactoryName string

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: azureDataFactoryName
}

resource sqlDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'WebMeetingsTable'
    parent: azureDataFactory
    properties: {
        annotations: []
        type: 'AzureSqlTable'
        linkedServiceName: {
            referenceName: 'NeoludeSQLDBLinkedService'
            type: 'LinkedServiceReference'
        }
        schema: []
        typeProperties: {
            table: 'WebMeetings'
            schema: 'VideoConference'
        }
        folder: {
            name: 'Tables'
        }
    }
}
