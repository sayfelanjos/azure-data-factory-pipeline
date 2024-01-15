# $pipelines = Get-ChildItem 'C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\pipelines'
# foreach ($pl in $pipelines.Name) { bicep build $pl }  
# $fileName = 'general_pl.json'
$destinationPath = 'C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\assets\armTemplates\copyPipelines'
$pipelineActivities = Get-Content "C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\pipelines\$($fileName)" | ConvertFrom-Json
$copyActivities = $pipelineActivities.resources.properties.activities.typeProperties.activities
$Suffix = '_pl.json'


foreach ($cp in $copyActivities) {
  # $cp | ConvertTo-Json # | Out-File -FilePath "$($destinationPath)\$($cp.name.tolower())$($Suffix)"
  $cp.typeProperties.translator | ConvertTo-Json -Depth 3
  $pipelineTemplate = @"
{
  "$('$schema')": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "dataFactoryName": {
      "type": "string"
    }
  },
  "variables": {
    "pipelineName": "$($cp.name.tolower())"
  },
  "resources": [
    {
      "type": "Microsoft.DataFactory/factories/pipelines",
      "apiVersion": "2018-06-01",
      "name": "[format('{0}/{1}', parameters('dataFactoryName'), variables('pipelineName'))]",
      "properties": {
        "activities": [
          {
            "name": "OneToOneCopyPipeline",
            "description": "Copy data from rest api to sql database table",
            "type": "Copy",
            "dependsOn": [],
            "policy": {
              "timeout": "$($cp.policy.timeout)",
              "retry": $($cp.policy.retry),
              "retryIntervalInSeconds": $($cp.policy.retryIntervalInSeconds),
              "secureOutput": $($cp.policy.secureOutput.ToString().ToLower()),
              "secureInput": $($cp.policy.secureInput.ToString().ToLower())
            },
            "userProperties": [],
            "typeProperties": {
              "source": {
                "type": "RestSource",
                "httpRequestTimeout": "$($cp.typeProperties.source.httpRequestTimeout)",
                "requestInterval": "$($cp.typeProperties.source.requestInterval)",
                "requestMethod": "$($cp.typeProperties.source.requestMethod)",
                "paginationRules": $($cp.typeProperties.source.paginationRules | ConvertTo-Json -Depth 3)
              },
              "sink": {
                "type": "AzureSqlSink",
                "writeBehavior": "$($cp.typeProperties.sink.writeBehavior)",
                "upsertSettings": $($cp.typeProperties.sink.upsertSettings | ConvertTo-Json -Depth 3),
                "sqlWriterUseTableLock": $($cp.typeProperties.sink.sqlWriterUseTableLock.ToString().ToLower()),
                "tableOption": "$($cp.typeProperties.sink.tableOption)",
                "disableMetricsCollection": $($cp.typeProperties.sink.disableMetricsCollection.ToString().ToLower())
              },
              "translator": $($cp.typeProperties.translator | ConvertTo-Json -Depth 3)
            },
            "inputs": [
              {
                "referenceName": "$($cp.name.ToLower())_ep",
                "type": "DatasetReference"
              }
            ],
            "outputs": [
              {
                "referenceName": "$($cp.name.ToLower())_tb",
                "type": "DatasetReference"
              }
            ]
          }
        ],
        "annotations": [],
        "folder": {
          "name": "one_to_one_copy_pl"
        },
        "parameters": {},
        "runDimensions": {},
        "variables": {}
      }
    }
  ]
}
"@
  Out-File -FilePath "$($destinationPath)\$($cp.name.tolower())$($Suffix)" -InputObject $pipelineTemplate
  bicep decompile "$($destinationPath)\$($cp.name.tolower())$($Suffix)" --outdir C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\copyPipelines
}
