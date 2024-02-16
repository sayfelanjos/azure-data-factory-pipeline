param dataFactoryName string

var pipelineName = 'ContentsCopyPipelines'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'copy_data_medialibrarypermissions_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_medialibraryvideos_pl'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_medialibrarypermissions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_medialibraryvideos_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_medialibraryvideos_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_videos_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_videos_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_videoviews_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_videos_pl'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_videoviews_pl'
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
    variables: {}
  }
}
