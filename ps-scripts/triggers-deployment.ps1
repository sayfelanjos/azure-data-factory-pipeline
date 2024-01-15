$triggersPath = '.\bicep\trigger'
$triggers = Get-ChildItem $triggersPath
$resourceGroupName =  $args[0]
$dataFactoryName = $args[1]


foreach ($tgr in $triggers) {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $tgr.FullName -dataFactoryName $dataFactoryName -ErrorAction SilentlyContinue
    Start-AzDataFactoryV2Trigger -ResourceGroupName $resourceGroupName -DataFactoryName $DataFactoryName -TriggerName $tgr.BaseName -Force -ErrorAction SilentlyContinue
}