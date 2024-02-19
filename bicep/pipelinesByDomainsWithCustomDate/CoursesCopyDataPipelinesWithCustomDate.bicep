param dataFactoryName string

var pipelineName = 'CoursesCopyDataPipelinesWithCustomDate'

resource dataFactoryName_pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: {
    activities: [
      {
        name: 'Execute CopyCoursesDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyCoursesDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyComponentActivitiesDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyEnrollablesDataWithCustomDatePipeline'
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
            referenceName: 'CopyComponentActivitiesDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyCourseCategoriesDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyCoursesDataWithCustomDatePipeline'
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
            referenceName: 'CopyCourseCategoriesDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyCourseTagsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyCourseTagsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyEnrollmentsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyEnrollablesDataWithCustomDatePipeline'
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
            referenceName: 'CopyEnrollmentsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyPlaceRoomsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyPlaceRoomsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyEnrollablesDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyCoursesDataWithCustomDatePipeline'
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
            referenceName: 'CopyEnrollablesDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyEquivalencyRequestsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyEnrollmentsDataWithCustomDatePipeline'
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
            referenceName: 'CopyEquivalencyRequestsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyPlacesDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: []
        policy: {
          secureInput: false
        }
        userProperties: []
        typeProperties: {
          pipeline: {
            referenceName: 'CopyPlacesDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyPlaceRoomsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyPlacesDataWithCustomDatePipeline'
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
            referenceName: 'CopyPlaceRoomsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyCoursePermissionsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyCoursesDataWithCustomDatePipeline'
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
            referenceName: 'CopyCoursePermissionsDataWithCustomDatePipeline'
            type: 'PipelineReference'
          }
          waitOnCompletion: true
        }
      }
      {
        name: 'Execute CopyCourseActivityViewsDataWithCustomDatePipeline'
        type: 'ExecutePipeline'
        dependsOn: [
          {
            activity: 'CopyEnrollablesDataWithCustomDatePipeline'
            dependencyConditions: [
              'Succeeded'
            ]
          }
          {
            activity: 'CopyCoursesDataWithCustomDatePipeline'
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
            referenceName: 'CopyCourseActivityViewsDataWithCustomDatePipeline'
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
