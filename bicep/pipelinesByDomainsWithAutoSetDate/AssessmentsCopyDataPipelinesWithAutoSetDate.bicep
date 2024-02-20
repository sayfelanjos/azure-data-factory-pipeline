param azureDataFactoryName string

var pipelineName = 'AssessmentsCopyDataPipelinesWithAutoSetDate'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopyQuestionsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyQuestionsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyExamsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyExamsDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyExamTakenAnswersDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyQuestionsDataWithAutoSetDatePipeline'
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
            referenceName: 'CopyExamTakenAnswersDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyExamTakenQuestionsDataPipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyQuestionsDataWithAutoSetDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CopyExamsDataWithAutoSetDatePipeline'
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
            referenceName: 'CopyExamTakenQuestionsDataPipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'CopyExamTakensDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyExamsDataWithAutoSetDatePipeline'
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
            referenceName: 'CopyExamTakensDataWithAutoSetDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyExamQuestionsDataWithAutoSetDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyExamsDataWithAutoSetDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CopyQuestionsDataWithAutoSetDatePipeline'
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
            referenceName: 'CopyExamQuestionsDataWithAutoSetDatePipeline'
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
