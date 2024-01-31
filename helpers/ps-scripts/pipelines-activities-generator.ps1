$copyPipelines = Get-ChildItem 'C:\Users\saymo\eng4tech\neolude\NEOLUDE-BI\bicep\copyPipelines'


foreach ($cpy in $copyPipelines) {
    $activity = @"
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
"@
}