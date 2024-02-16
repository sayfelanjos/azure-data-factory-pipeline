$triggersPath = '.\bicep\trigger'
$trigger = Get-ChildItem $triggersPath
$resourceGroupName =  $args[0]
$dataFactoryName = $args[1]


New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -Name $trigger.BaseName -TemplateFile '.\bicep\trigger\ExecuteAllCopyDataPipelinesTrigger.bicep' -Mode Incremental -dataFactoryName $dataFactoryName
Start-AzDataFactoryV2Trigger -ResourceGroupName $resourceGroupName -DataFactoryName $DataFactoryName -TriggerName $trigger.BaseName -Force -ErrorAction SilentlyContinue