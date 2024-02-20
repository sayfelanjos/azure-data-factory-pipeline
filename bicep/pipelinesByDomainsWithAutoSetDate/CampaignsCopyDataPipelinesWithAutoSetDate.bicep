param azureDataFactoryName string

var pipelineName = 'CampaignsCopyDataPipelinesWithAutoSetDate'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopyCampaigncontentsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyCampaigncontentsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyCampaignsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyCampaigncontentsDataWithAutoSetDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
        ]
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyCampaignsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyCampaignPermissionsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyCampaignsDataWithAutoSetDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
        ]
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyCampaignPermissionsDataWithAutoSetDatePipeline'
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
