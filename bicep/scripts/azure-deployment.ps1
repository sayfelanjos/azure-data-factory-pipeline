$resourceGroupName = 'inspand-lab'
$Location = 'brazilsouth'
$servicePrincipalObjectId = '3a12d11f-7348-4b4a-ac88-3e8204b840f0'
$baseURL = 'https://data-api.neolude.com.br/'
$relativeURL = '/'

New-AzSubscriptionDeployment `
    -Location $Location `
    -TemplateFile '..\resourceGroup.bicep' `
    -resourceGroupName $resourceGroupName `
    -resourceGroupLocation $Location 

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\keyVault.bicep' `
    -objectId $servicePrincipalObjectId

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\sqlServerDeployment.bicep' `
    -sqlServerUserName 'neoludeAdmin'

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\azureDataFactoryDeployment.bicep' `
    -baseURL $baseURL `
    -relativeURL $relativeURL `
    -sqlServerUserName 'neoludeAdmin'