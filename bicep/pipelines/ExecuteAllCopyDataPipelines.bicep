param dataFactoryName string

var pipelineName = 'ExecuteAllCopyDataPipelines'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'AssessmentsCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'UsersCopyPipelines'
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
            referenceName: 'AssessmentsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'UsersCopyPipelines'
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
      {
        name: 'AudiosCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'AudiosCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'CampaignsCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CampaignsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Categories'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CategoriesCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'ContentsCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'UsersCopyPipelines'
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
            referenceName: 'ContentsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'CoursesCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'UsersCopyPipelines'
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
            referenceName: 'CoursesCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'FilesCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'UsersCopyPipelines'
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
            referenceName: 'FilesCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'FilesSendCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'FilesSendCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'HtmlPagesCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'UsersCopyPipelines'
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
            referenceName: 'HtmlPagesCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'PowerPointPresentationCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PowerPointPresentationCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'PresentialMeetingsCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PresentialMeetingsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'ResearchCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CoursesCopyPipelines'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'CampaignsCopyPipelines'
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
            referenceName: 'ResearchCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Scorms'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'ScormsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'TagsCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CoursesCopyPipelines'
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
            referenceName: 'TagsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'VideoConferenceCopyPipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'VideoConferenceCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'CertificationsCopyPipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CoursesCopyPipelines'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'UsersCopyPipelines'
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
            referenceName: 'CertificationsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'TagsCopyPipelines1'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CoursesCopyPipelines'
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
            referenceName: 'TagsCopyPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
    ]
    annotations: []
    variables: {}
  }
}
