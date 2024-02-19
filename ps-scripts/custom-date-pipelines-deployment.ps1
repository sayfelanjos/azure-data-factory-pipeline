$pipelinesPath = '.\bicep\pipelinesByDomainsWithCustomDate'
$copyPipelinesPath = '.\bicep\copyDataPipelinesWithCustomDate'
$pipelines = Get-ChildItem $pipelinesPath
$copyPipelines = Get-ChildItem $copyPipelinesPath
$resourceGroupName = $args[0]
$azureDataFactoryName = $args[1]

foreach ($pl in $copyPipelines) {
    New-AzResourceGroupDeployment `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $pl.FullName `
        -azureDataFactoryName $azureDataFactoryName `
        -ErrorAction SilentlyContinue
}

foreach ($pl in $pipelines) {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile $pl.FullName `
    -azureDataFactoryName $azureDataFactoryName `
    -ErrorAction SilentlyContinue
}

