$resourceGroupName = $args[0]
$DataFactoryName = $args[1]
$triggerName = 'ExecuteAllCopyPipelinesTrigge'

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName $triggerName `
    -Force