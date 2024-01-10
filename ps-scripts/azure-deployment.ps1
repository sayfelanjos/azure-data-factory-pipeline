$Customer = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$Location = 'brazilsouth'
$resourceGroupName = "$($Customer)-$($Department)-$($Environment)-rg"
$baseURL = 'https://jsonplaceholder.typicode.com'
$relativeURL = '/users'
$DataFactoryName = "$($Customer)-$($Department)-$($Environment)-adf"
$pipelineName = ''
$triggerName = "$($pipelineName)-trigger"

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '..\bicep\resourceGroup.bicep' `
    -resourceGroupLocation $Location `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -resourceGroupName $resourceGroupName `
    -TemplateFile '.\bicep\azureDataFactory.bicep' `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\bicep\sqlServer.bicep' `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\bicep\azureDataFactoryLinkedServices.bicep' `
    -baseURL $baseURL `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\bicep\azureDataFactoryDataSets.bicep' `
    -relativeURL $relativeURL `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\bicep\azureDataFactoryPipeline.bicep' `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\bicep\azureDataFactoryTrigger.bicep' `
    -environment $Environment `
    -customer $Customer `
    -department $Department `
    -Mode Incremental

Start-AzDataFactoryV2Trigger `
    -ResourceGroupName $resourceGroupName `
    -DataFactoryName $DataFactoryName `
    -TriggerName $triggerName `
    -Force
