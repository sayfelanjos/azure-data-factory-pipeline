@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource dataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'medialibraryfiledownloads_ep'
    parent: dataFactory
    properties: {
        annotations: []
        type: 'RestResource'
        parameters: {
            SetApiName: {
                type: 'string'
                defaultValue: '/medialibraryfiledownloads?page={pagina}&page_size=5000'
            }
        }
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
