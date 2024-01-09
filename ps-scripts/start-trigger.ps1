$resourceGroupName = $args[0]
$DataFactoryName = "$($resourceGroupName)-data-factory"

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName 'azure-devops-pipeline-trigger' `
    -Force