param dataFactoryName string

var pipelineName = 'AssessmentsCopyPipelines'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute QuestionsCopyData'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_questions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute ExamsCopyData'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'copy_data_exams_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_examtakenanswers_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute QuestionsCopyData'
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
            referenceName: 'copy_data_examtakenanswers_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_examtakenquestions_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute QuestionsCopyData'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute ExamsCopyData'
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
            referenceName: 'copy_data_examtakenquestions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_examtakens_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute ExamsCopyData'
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
            referenceName: 'copy_data_examtakens_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'copy_data_examquestions_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'Execute ExamsCopyData'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'Execute QuestionsCopyData'
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
            referenceName: 'copy_data_examquestions_pl'
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
    variables: {}
  }
}
