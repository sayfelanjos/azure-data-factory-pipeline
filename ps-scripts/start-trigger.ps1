$resourceGroupName = $args[0]
$department = $args[1]
$environment = $args[2]
$customer = $args[3]
$DataFactoryName = "adf-$($customer)-$($department)-$($environment)"

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName 'trigger' `
    -Force