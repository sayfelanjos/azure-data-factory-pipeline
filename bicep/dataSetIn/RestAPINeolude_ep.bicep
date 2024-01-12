@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource symbolicname 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'RestAPINeolude_ep'
    parent: dataFactory
    properties: {
        annotations: []
        parameters: {
            SetApiName: {
                type: 'String'
            }
        }
        type: 'RestResource'
        linkedServiceName: {
            referenceName: 'rest-api-linked-service'
            type: 'LinkedServiceReference'
        }
        schema: { }
        typeProperties: {
            relativeUrl: '@dataset().SetApiName'
        }
        folder: {
            name: 'rest_endpoints'
        }
    }
}    
