param dataFactoryName string

var pipelineName = 'ExecuteAllCopyDataPipelinesWithCustomDate'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute AssessmentsCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithCustomDate'
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
            referenceName: 'AssessmentsCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute UsersCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyUsersDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute AudiosCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'AudiosCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CampaignsCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CampaignsCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CategoriesCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CategoriesCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ContentsCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithCustomDate'
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
            referenceName: 'ContentsCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CoursesCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithCustomDate'
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
            referenceName: 'CoursesCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithCustomDate'
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
            referenceName: 'FilesCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesSendCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'FilesSendCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute HtmlPagesCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCopyDataPipelinesWithCustomDate'
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
            referenceName: 'HtmlPagesCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PowerPointPresentationCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PowerPointPresentationCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PresentialMeetingsCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PresentialMeetingsCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ResearchCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithCustomDate'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CampaignsCopyDataPipelinesWithCustomDate'
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
            referenceName: 'ResearchCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ScormsCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'ScormsCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute TagsCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithCustomDate'
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
            referenceName: 'TagsCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute VideoConferenceCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'VideoConferenceCopyDataPipelinesWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CertificationsCopyDataPipelineWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithCustomDate'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute UsersCopyDataPipelinesWithCustomDate'
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
            referenceName: 'CertificationsCopyDataPipelineWithCustomDate'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute TagsCopyDataPipelinesWithCustomDate'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCopyDataPipelinesWithCustomDate'
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
            referenceName: 'TagsCopyDataPipelinesWithCustomDate'
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
