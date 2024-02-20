param azureDataFactoryName string

var pipelineName = 'ContentsCopyDataPipelinesWithAutoSetDate'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopyMediaLibraryPermissionsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyMediaLibraryVideosDataWithAutoSetDatePipeline'
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
            referenceName: 'CopyMediaLibraryPermissionsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyMediaLibraryVideosDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyMediaLibraryVideosDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyVideosDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyVideosDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyVideoViewsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyVideosDataWithAutoSetDatePipeline'
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
            referenceName: 'CopyVideoViewsDataWithAutoSetDatePipeline'
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
