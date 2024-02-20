param azureDataFactoryName string

var pipelineName = 'ExecuteAllCustomDatePipelines'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute AssessmentsCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCustomDatePipelines'
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
            referenceName: 'AssessmentsCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute UsersCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyUsersCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute AudiosCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'AudiosCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CampaignsCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CampaignsCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CategoriesCustomDatePipelinesPipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CategoriesCustomDatePipelinesPipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ContentsCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCustomDatePipelines'
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
            referenceName: 'ContentsCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CoursesCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCustomDatePipelines'
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
            referenceName: 'CoursesCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCustomDatePipelines'
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
            referenceName: 'FilesCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute FilesSendCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'FilesSendCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute HtmlPagesCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute UsersCustomDatePipelines'
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
            referenceName: 'HtmlPagesCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PowerPointPresentationCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PowerPointPresentationCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute PresentialMeetingsCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'PresentialMeetingsCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ResearchCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCustomDatePipelines'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CampaignsCustomDatePipelines'
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
            referenceName: 'ResearchCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ScormsCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'ScormsCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute TagsCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCustomDatePipelines'
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
            referenceName: 'TagsCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute VideoConferenceCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'VideoConferenceCustomDatePipelines'
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
            activity: 'Execute CoursesCustomDatePipelines'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute UsersCustomDatePipelines'
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
        name: 'Execute TagsCustomDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CoursesCustomDatePipelines'
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
            referenceName: 'TagsCustomDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
    ]
    folder: {
      name: 'ExecuteAll'
    }
    annotations: []
    variables: {}
  }
}
