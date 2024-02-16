$resourceGroupName = $args[0]
$DataFactoryName = $args[1]
$triggerName = 'ExecuteAllCopyDataPipelinesTrigger'

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName $triggerName `
    -Force