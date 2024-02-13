@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource dataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'places_ep'
    parent: dataFactory
    properties: {
        parameters: {
            SetApiName: {
                type: 'String'
            }
        }
        annotations: []
        type: 'RestResource'
        linkedServiceName: {
            referenceName: 'rest-api-linked-service'
            type: 'LinkedServiceReference'
        }
        schema: {}
        typeProperties: {
            relativeUrl: '@dataset().SetApiName'
        }
        folder: {
            name: 'rest_endpoints'
        }
    }
}
