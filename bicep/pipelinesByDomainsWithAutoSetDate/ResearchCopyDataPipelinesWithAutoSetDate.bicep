param azureDataFactoryName string

var pipelineName = 'ResearchCopyDataPipelinesWithAutoSetDate'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopySurveyAnswerQuestionsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopySurveyAnswerQuestionsDataWithAutoSetDatePipeline'
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
            activity: 'Execute CopySurveyQuestionOptionsDataWithAutoSetPipeline'
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
            referenceName: 'CopySurveyAnswerQuestionsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopySurveyAnswerQuestionsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopySurveysDataWithAutoSetDatePipeline'
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
            referenceName: 'CopySurveyAnswerQuestionsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'CopySurveyQuestionOptionsDataWithAutoSetPipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopySurveyQuestionOptionsDataWithAutoSetPipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopySurveysDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopySurveysDataWithAutoSetDatePipeline'
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
            activity: 'Execute CopySurveysDataWithAutoSetDatePipeline'
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
      name: 'PipelinesByDomainsWithAutoSetDate'
    }
    annotations: []
    variables: {}
  }
}
