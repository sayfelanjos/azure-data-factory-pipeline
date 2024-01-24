$resourceGroupName = $args[0]
$department = $args[1]
$environment = $args[2]
$customer = $args[3]
$DataFactoryName = "$($customer)-$($department)-$($environment)-adf"
$pipelineName = 'copy-pipeline'
$triggerName = "$($pipelineName)-trigger"

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName $triggerName `
    -Force