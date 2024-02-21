$resourceGroupName = $args[0]
$azureDataFactoryName = $args[1]
$triggers =  Get-ChildItem '.\bicep\trigger'


foreach ($tgr in $triggers) {
    Stop-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $azureDataFactoryName `
    -TriggerName $tgr.BaseName `
    -Force
}
