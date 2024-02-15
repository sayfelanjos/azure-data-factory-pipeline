param dataFactoryName string

var pipelineName = 'ResearchCopyPipelines'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'copy_data_surveyanswerquestions_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_surveyanswers_pl'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'copy_data_surveyquestions_pl'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'copy_data_surveyquestionoptions_pl'
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
            referenceName: 'copy_data_surveyanswerquestions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_surveyanswers_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_surveys_pl'
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
            referenceName: 'copy_data_surveyanswers_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_surveyquestionoptions_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_surveyquestionoptions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_surveys_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_surveys_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_surveyquestions_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'copy_data_surveys_pl'
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
            referenceName: 'copy_data_surveyquestions_pl'
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