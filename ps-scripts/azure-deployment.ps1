$CustomerName = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$Location = 'brazilsouth'
$resourceGroupName = "$($CustomerName)-$($Department)-$($Environment)-$($Location)"

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