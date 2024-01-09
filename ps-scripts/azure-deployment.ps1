$CustomerName = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$Location = 'brazilsouth'
$resourceGroupName = "$($CustomerName)-$($Department)-$($Environment)"
$baseURL = 'https://jsonplaceholder.typicode.com'
$relativeURL = '/users'

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '..\bicep\resourceGroup.bicep' `
    -resourceGroupLocation $Location `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -resourceGroupName $resourceGroupName `
    -TemplateFile '..\bicep\azureDataFactory.bicep' `
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