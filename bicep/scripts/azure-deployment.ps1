$resourceGroupName = 'DevOps-Test-NEOLUDE-BI'
# $Location = 'brazilsouth'
$baseURL = 'https://data-api.neolude.com.br/'
$relativeURL = '/'

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '..\resourceGroup.bicep' `
    -resourceGroupLocation $Location 

New-AzResourceGroupDeployment `
    -resourceGroupName $resourceGroupName `
    -TemplateFile '..\azureDataFactory.bicep'

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\sqlServer.bicep' `

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\azureDataFactoryLinkedServicesModule.bicep' `
    -baseURL $baseURL `
    -sqlServerUserName 'neoludeAdmin'

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\azureDataFactoryDataSet.bicep' `
    -relativeURL $relativeURL

    New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '..\azureDataFactoryPipeline.bicep'

