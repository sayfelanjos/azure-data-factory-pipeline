$CustomerName = 'neolude'
$Environment = 'dev'
$Department = 'bi'
$resourceGroupName = "$($CustomerName)-$($Department)-$($Environment)-$($Location)"
$Location = 'brazilsouth'

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '.\bicep\resourceGroup.bicep' `
    -resourceGroupLocation $Location