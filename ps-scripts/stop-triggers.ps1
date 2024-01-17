$resourceGroupName = $args[0]
$DataFactoryName = $args[1]
$triggers =  Get-ChildItem '.\bicep\trigger'


foreach ($tgr in $triggers) {
    Stop-AzDataFactoryV2Trigger `
        -ResourceGroupName $resourceGroupName `
        -DataFactoryName $DataFactoryName `
        -TriggerName $tgr.BaseName `
        -Force
}
