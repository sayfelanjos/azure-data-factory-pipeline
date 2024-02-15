param dataFactoryName string

var pipelineName = 'CampaignsCopyPipelines'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'copy_data_campaigncontents_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_campaigncontents_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_campaigns_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_campaigncontents_pl'
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
            referenceName: 'copy_data_campaigns_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_campaignpermissions_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_campaigns_pl'
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
            referenceName: 'copy_data_campaignpermissions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
    ]
    folder: {
      name: 'PipelinesByDomains'
    }
    annotations: []
  }
}