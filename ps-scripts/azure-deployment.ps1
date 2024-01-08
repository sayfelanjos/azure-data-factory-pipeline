$CustomerName = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$Location = 'brazilsouth'
$resourceGroupName = "$($CustomerName)-$($Department)-$($Environment)-$($Location)"
$baseURL = 'https://data-api.neolude.com.br/'
$relativeURL = '/'

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '..\bicep\resourceGroup.bicep' `
    -resourceGroupLocation $Location

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