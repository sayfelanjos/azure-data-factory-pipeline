param azureDataFactoryName string

var pipelineName = 'CertificationsCopyDataPipelinesWithAutoSetDate'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopyCertificationsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyCertificationsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'CopyUserCertificationsDataWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyUserCertificationsDataWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
    ]
    folder: {
      name: 'PipelinesByDomainsWithAutoSetDate'
    }
    annotations: []
    variables: {}
  }
}
