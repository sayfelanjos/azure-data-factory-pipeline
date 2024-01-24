$resourceGroupName = $args[0]
$dataFactoryName = $args[1]
$triggers =  Get-ChildItem '.\bicep\trigger'


foreach ($tgr in $triggers) {
    Stop-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $dataFactoryName `
    -TriggerName $tgr.BaseName `
    -Force
}
