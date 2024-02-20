param dataFactoryName string
param DataSetInName string

@description('Relative URL is the last part of the url start after the Top-Level-Domain')
param relativeURL string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource dataFactoryDataSetIn 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: DataSetInName
  properties: {
    linkedServiceName: {
      referenceName: 'NeoludeRestAPILinkedService'
      type: 'LinkedServiceReference'
    }
    type: 'RestResource'
    typeProperties: {
      relativeUrl: relativeURL
      requestMethod: 'Get'
    }
  }
}
