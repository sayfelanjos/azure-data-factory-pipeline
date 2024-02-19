param dataFactoryName string

var pipelineName = 'ResearchCopyDataPipelinesWithCustomDate'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopySurveyAnswerQuestionsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopySurveyAnswerQuestionsDataWithCustomDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CopySurveyQuestionsDataWtihAutoDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CopySurveyQuestionOptionsDataWithCustomPipeline'
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
            referenceName: 'CopySurveyAnswerQuestionsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopySurveyAnswerQuestionsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopySurveysDataWithCustomDatePipeline'
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
            referenceName: 'CopySurveyAnswerQuestionsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'CopySurveyQuestionOptionsDataWithCustomPipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopySurveyQuestionOptionsDataWithCustomPipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopySurveysDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopySurveysDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopySurveyQuestionsDataWtihAutoDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopySurveysDataWithCustomDatePipeline'
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
            referenceName: 'CopySurveyQuestionsDataWtihAutoDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
    ]
    folder: {
      name: 'PipelinesByDomainsWithCustomDate'
    }
    annotations: []
    variables: {}
  }
}
