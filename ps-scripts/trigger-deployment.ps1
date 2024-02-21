$triggersPath = '.\bicep\trigger'
$trigger = Get-ChildItem $triggersPath
$resourceGroupName =  $args[0]
$azureDataFactoryName = $args[1]


New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -Name $trigger.BaseName -TemplateFile $trigger.FullName -Mode Incremental -azureDataFactoryName $azureDataFactoryName
Start-AzDataFactoryV2Trigger -ResourceGroupName $resourceGroupName -DataFactoryName $azureDataFactoryName -TriggerName $trigger.BaseName -Force # -ErrorAction SilentlyContinue