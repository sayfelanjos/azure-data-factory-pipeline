@description('Data Factory Name')
param azureDataFactoryName string

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: azureDataFactoryName
}

resource dataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'CampaignContentsTable'
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
            table: 'CampaignContents'
            schema: 'Campaigns'
        }
        folder: {
            name: 'Tables'
        }
    }
}
