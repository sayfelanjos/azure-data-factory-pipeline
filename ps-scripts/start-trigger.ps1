$resourceGroupName = $args[0]
$department = $args[1]
$environment = $args[2]

$DataFactoryName = "adf-$($department)-$($environment)"

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName 'azure-devops-pipeline-trigger' `
    -Force