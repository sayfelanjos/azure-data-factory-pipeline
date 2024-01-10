import { schemaMappings } from 'schemaMappings.bicep'

@description('Data Factory Name')
param dataFactoryName string

module adfPipelines 'azureDataFactoryPipelineModule.bicep' = [for schema in items(schemaMappings): {
  name: 'PipelinesModule'
  params: {
    pipelineName: schema.key
    dataFactoryName: dataFactoryName
    datasetInName: schema.dataSetInName
    datasetOutName: schema.dataSetOutName
    schemaMapping: schema.schemaMapping
  }
}]
