param azureDataFactoryName string

var pipelineName = 'ExecuteAllAutoSetDatePipelines'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute AssessmentsAutoSetDatePipelines'
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
            referenceName: 'AssessmentsAutoSetDatePipelines'
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
            referenceName: 'CopyUsersAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute AudiosAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'AudiosAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CampaignsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CampaignsAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CategoriesAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CategoriesAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ContentsAutoSetDatePipelines'
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
            referenceName: 'ContentsAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CoursesAutoSetDatePipelines'
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
            referenceName: 'CoursesAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesAutoSetDatePipelines'
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
            referenceName: 'FilesAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesSendAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'FilesSendAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute HtmlPagesAutoSetDatePipelines'
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
            referenceName: 'HtmlPagesAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PowerPointPresentationAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PowerPointPresentationAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PresentialMeetingsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PresentialMeetingsAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ResearchAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesAutoSetDatePipelines'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CampaignsAutoSetDatePipelines'
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
            referenceName: 'ResearchAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ScormsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'ScormsAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute TagsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesAutoSetDatePipelines'
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
            referenceName: 'TagsAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute VideoConferenceAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'VideoConferenceAutoSetDatePipelines'
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
            activity: 'Execute CoursesAutoSetDatePipelines'
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
        name: 'Execute TagsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesAutoSetDatePipelines'
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
            referenceName: 'TagsAutoSetDatePipelines'
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
