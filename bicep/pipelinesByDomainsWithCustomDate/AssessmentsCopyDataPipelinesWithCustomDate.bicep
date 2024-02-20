param azureDataFactoryName string

var pipelineName = 'AssessmentsCopyDataPipelinesWithCustomDate'

resource azureDataFactoryPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${azureDataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopyQuestionsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyQuestionsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyExamsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyExamsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyExamTakenAnswersDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyQuestionsDataWithCustomDatePipeline'
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
            referenceName: 'CopyExamTakenAnswersDataWithCustomDatePipeline'
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
            activity: 'Execute CopyQuestionsDataWithCustomDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CopyExamsDataWithCustomDatePipeline'
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
        name: 'CopyExamTakensDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyExamsDataWithCustomDatePipeline'
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
            referenceName: 'CopyExamTakensDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyExamQuestionsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute CopyExamsDataWithCustomDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute CopyQuestionsDataWithCustomDatePipeline'
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
            referenceName: 'CopyExamQuestionsDataWithCustomDatePipeline'
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
