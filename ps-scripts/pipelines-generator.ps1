# $pipelines = Get-ChildItem 'C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\pipelines'
# foreach ($pl in $pipelines.Name) { bicep build $pl }  
$workspace = 'C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\copyPipelines'
$pipelineActivities = Get-Content 'C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\pipelines\general_pl.json' | ConvertFrom-Json
$copyActivities = $pipelineActivities.resources.properties.activities.typeProperties.activities
$Suffix = '_pl.bicep'
$dataFactoryName
$pipelineName

foreach ($cp in $copyActivities) {
    # $cp | ConvertTo-Json | Write-Host
    # $cp.name.tolower()
    $pipelineTemplate = @"
@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: dataFactoryName
}

resource symbolicname 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
    name: '$($cp.name.ToLower())'
    parent: dataFactory
    description: 'Extract data from rest api to sql database'
    properties: {
        activities: [
            {
              name: 'CopyFromRestToSQLDatabase'
              type: 'Copy'
              dependsOn: []
              policy: {
                timeout: '$($cp.policy.timeout)'
                retry: $($cp.policy.retry)
                retryIntervalInSeconds: $($cp.policy.retryIntervalInSeconds)
                secureOutput: '$($cp.policy.secureOutput)'
                secureInput: '$($cp.policy.secureInput)'
              }
              userProperties: []
              typeProperties: {
                source: {
                  type: '$($cp.typeProperties.source.type)'
                  requestMethod: '$($cp.typeProperties.source.requestMethod)'
                  requestInternal: '$($cp.typeProperties.source.requestInternal)'
                  httpRequestTimeout: '$($cp.typeProperties.source.httpRequestTimeout)'
                  paginationRules: '$($cp.typeProperties.source.paginationRules)'
                }
                sink: {
                  type: 'AzureSqlSink'
                  writeBehavior: '$($cp.typeProperties.sink.writeBehavior)'
                  sqlWriterUseTableLock: '$($cp.typeProperties.sink.sqlWriterUseTableLock)'
                  tableOption: '$($cp.typeProperties.sick.tableOption)'
                  disableMetricsCollection: '$($cp.typeProperties.sink.disableMetricsCollection)'
                }
                enableStaging: '$($cp.typeProperties.enableStaging)'
                translator: $($cp.translator)
              }
              inputs: [
                {
                  referenceName: dataFactoryDataSetIn.name
                  type: 'DatasetReference'
                }
              ]
              outputs: [
                {
                  referenceName: dataFactoryDataSetOut.name
                  type: 'DatasetReference'
                }
              ]
            }
          ]
    }
}
"@
    Out-File -FilePath "$($workspace)\$($cp.name.tolower())$($Suffix)" -InputObject $pipelineTemplate
}
