$CustomerName = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$resourceGroupName = "$($CustomerName)-$($Department)-$($Environment)"
$DataFactoryName = "$($resourceGroupName)-data-factory"

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName 'azure-devops-pipeline-trigger' `
    -Force