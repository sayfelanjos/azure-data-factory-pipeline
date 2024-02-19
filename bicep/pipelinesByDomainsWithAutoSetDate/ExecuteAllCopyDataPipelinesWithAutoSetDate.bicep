param dataFactoryName string

var pipelineName = 'ExecuteAllCopyDataPipelinesWithAutoSetDate'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute AssessmentsCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'AssessmentsCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute UsersCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyUsersDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute AudiosCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'AudiosCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CampaignsCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CampaignsCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CategoriesCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CategoriesCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ContentsCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'ContentsCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CoursesCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'CoursesCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'FilesCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesSendCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'FilesSendCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute HtmlPagesCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'HtmlPagesCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PowerPointPresentationCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PowerPointPresentationCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PresentialMeetingsCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PresentialMeetingsCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ResearchCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithAutoSetDate'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CampaignsCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'ResearchCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ScormsCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'ScormsCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute TagsCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'TagsCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute VideoConferenceCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'VideoConferenceCopyDataPipelinesWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CertificationsCopyDataPipelineWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithAutoSetDate'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute UsersCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'CertificationsCopyDataPipelineWithAutoSetDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute TagsCopyDataPipelinesWithAutoSetDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithAutoSetDate'
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
            referenceName: 'TagsCopyDataPipelinesWithAutoSetDate'
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
