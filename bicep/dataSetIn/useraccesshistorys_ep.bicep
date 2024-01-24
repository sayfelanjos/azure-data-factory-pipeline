@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource dataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'useraccesshistorys_ep'
    parent: dataFactory
    properties: {
        annotations: []
        type: 'RestResource'
        linkedServiceName: {
            referenceName: 'rest-api-linked-service'
            type: 'LinkedServiceReference'
        }
        schema: {}
        typeProperties: {
            relativeUrl: '/useraccesshistorys'
        }
        folder: {
            name: 'rest_endpoints'
        }
    }
}
