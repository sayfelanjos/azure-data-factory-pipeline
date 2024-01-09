$CustomerName = $args[0]
$Environment = $args[1]
$Department = $args[2]
$resourceGroupName = "$($CustomerName)-$($Department)-$($Environment)"
$DataFactoryName = "$($resourceGroupName)-data-factory"

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName 'azure-devops-pipeline-trigger' `
    -Force