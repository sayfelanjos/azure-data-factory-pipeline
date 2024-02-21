param azureDataFactoryName string

var pipelineName = 'ExecuteAllAutoSetDatePipelines'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Exec UsersAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'UsersAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Exec AssessmentsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec UsersAutoSetDatePipelines'
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
        name: 'Exec AudiosAutoSetDatePipelines'
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
        name: 'Exec CampaignsAutoSetDatePipelines'
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
        name: 'Exec CategoriesAutoSetDatePipelines'
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
        name: 'Exec ContentsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec UsersAutoSetDatePipelines'
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
        name: 'Exec CoursesAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec UsersAutoSetDatePipelines'
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
        name: 'Exec FilesAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec UsersAutoSetDatePipelines'
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
        name: 'Exec FilesSendAutoSetDatePipelines'
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
        name: 'Exec HtmlPagesAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec UsersAutoSetDatePipelines'
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
        name: 'Exec PowerPointPresentationAutoSetDatePipelines'
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
        name: 'Exec PresentialMeetingsAutoSetDatePipelines'
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
        name: 'Exec ResearchAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec CoursesAutoSetDatePipelines'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Exec CampaignsAutoSetDatePipelines'
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
        name: 'Exec ScormsAutoSetDatePipelines'
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
        name: 'Exec VideoConferenceAutoSetDatePipelines'
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
        name: 'Exec CertificationsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec CoursesAutoSetDatePipelines'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Exec UsersAutoSetDatePipelines'
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
            referenceName: 'CertificationsAutoSetDatePipelines'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Exec TagsAutoSetDatePipelines'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Exec CoursesAutoSetDatePipelines'
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
    folder: {
      name: 'ExecuteAll'
    }
    annotations: []
    variables: {}
  }
}
