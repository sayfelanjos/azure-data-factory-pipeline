param pipelineName string 

@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource execute_pl 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: pipelineName
  parent: dataFactory
  properties: {
    activities: [
      {
        name: 'course_permissions_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'contents_pl_2'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'course_permissions_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'general_pl'
        type: 'ExecutePipeline'
        dependsOn: []
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'general_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'courses_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'general_pl'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'courses_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'contents_pl'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'courses_pl'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'contents_pl'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'contents_pl_2'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'contents_pl'
            dependencyConditions: [
              'Completed'
            ]
          }
        ]
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'contents_pl_2'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
    ]
    annotations: []
  }
}
