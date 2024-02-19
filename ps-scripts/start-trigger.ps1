$resourceGroupName = $args[0]
$azureDataFactoryName = $args[1]
$triggerName = 'ExecuteAllCopyDataPipelinesWithAutoSetDateTrigger'

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -azureDataFactoryName $azureDataFactoryName `
    -TriggerName $triggerName `
    -Force