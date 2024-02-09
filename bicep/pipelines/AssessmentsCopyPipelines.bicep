// param dataFactoryName string

// var pipelineName = 'copy_data_surveyquestions_pl'

// resource symbolicname 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
//   name: '${dataFactoryName}/${pipelineName}'
//   properties: {
//     activities: [
//       {
//         // dependsOn: [
//         //   {
//         //     activity: 'string'
//         //     dependencyConditions: [
//         //       'string'
//         //     ]
//         //   }
//         // ]
//         // description: 'string'
//         // name: 'string'
//         // userProperties: [
//         //   {
//         //     name: 'string'
//         //     value: any()
//         //   }
//         // ]
//         type: 'ForEach'
//         typeProperties: {
//           activities: [
//             {
//               dependsOn: [
//                 {
//                   activity: 'string'
//                   dependencyConditions: [
//                     'string'
//                   ]
//                 }
//               ]
//               description: 'string'
//               name: 'string'
//               userProperties: [
//                 {
//                   name: 'string'
//                   value: any()
//                 }
//               ]
//               type: 'ExecutePipeline'
//               policy: {
//                 secureInput: bool
//               }
//               typeProperties: {
//                 parameters: {}
//                 pipeline: {
//                   name: 'string'
//                   referenceName: 'string'
//                   type: 'PipelineReference'
//                 }
//                 waitOnCompletion: bool
//               }
//             }
//           ]
//           batchCount: int
//           isSequential: bool
//           items: {
//             type: 'Expression'
//             value: 'string'
//           }
//         }
//       }
//     ]
//     annotations: [
//       any
//     ]
//     concurrency: int
//     description: 'string'
//     folder: {
//       name: 'string'
//     }
//     parameters: {}
//     policy: {
//       elapsedTimeMetric: {
//         duration: any()
//       }
//     }
//     runDimensions: {}
//     variables: {}
//   }
// }
