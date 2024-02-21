$resourceGroupName = $args[0]
$azureDataFactoryName = $args[1]
$triggerName = 'ExecuteAllCopyDataPipelinesWithAutoSetDateTrigger'

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $azureDataFactoryName `
    -TriggerName $triggerName `
    -Force