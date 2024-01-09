$CustomerName = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$Location = 'brazilsouth'
$resourceGroupName = "$($CustomerName)-$($Department)-$($Environment)"

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '.\bicep\resourceGroup.bicep' `
    -resourceGroupLocation $Location
