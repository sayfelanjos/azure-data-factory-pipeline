@description('Data Factory Name')
param azureDataFactoryName string

resource azureDataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: azureDataFactoryName
}

resource dataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: 'SurveyQuestionsEndPoint'
    parent: azureDataFactory
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
            name: 'EndPoints'
        }
    }
}
