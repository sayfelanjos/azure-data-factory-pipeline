$CustomerName = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$Location = 'brazilsouth'
$resourceGroupName = "$($CustomerName)-rg-$($Department)-$($Environment)"

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '.\bicep\resourceGroup.bicep' `
    -resourceGroupLocation $Location

New-AzResourceGroupDeployment `
    -resourceGroupName $resourceGroupName `
    -TemplateFile '.\bicep\azureDataFactory.bicep' `
    -Mode Incremental
