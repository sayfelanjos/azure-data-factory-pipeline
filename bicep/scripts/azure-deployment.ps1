$resourceGroupName = 'DevOps-Test-NEOLUDE-BI'
$Location = 'brazilsouth'
$baseURL = 'https://data-api.neolude.com.br/'
$relativeURL = '/'

New-AzSubscriptionDeployment `
    -resourceGroupName $resourceGroupName `
    -Location $Location `
    -TemplateFile '.\bicep\resourceGroup.bicep' `
    -resourceGroupLocation $Location

New-AzResourceGroupDeployment `
    -resourceGroupName $resourceGroupName `
    -TemplateFile '.\bicep\azureDataFactory.bicep' `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '.\bicep\sqlServer.bicep' `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '.\bicep\azureDataFactoryLinkedServicesModule.bicep' `
    -baseURL $baseURL `
    -sqlServerUserName 'neoludeAdmin' `
    -Mode Incremental

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '.\bicep\azureDataFactoryDataSet.bicep' `
    -relativeURL $relativeURL `
    -Mode Incremental

    New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile '.\bicep\azureDataFactoryPipeline.bicep' `
    -Mode Incremental