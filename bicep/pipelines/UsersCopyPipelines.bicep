param dataFactoryName string

var pipelineName = 'UsersCopyPipelines'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'copy_data_businessunits_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_businessunits_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_labels_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_labels_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_occupationareas_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_occupationareas_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_positions_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_positions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_useraccesshistorys_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_useraccesshistorys_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_userbusinessunits_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_businessunits_pl'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'copy_data_users_pl'
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
            referenceName: 'copy_data_userbusinessunits_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_userlabels_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_users_pl'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'copy_data_labels_pl'
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
            referenceName: 'copy_data_userlabels_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_users_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_users_pl'
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
