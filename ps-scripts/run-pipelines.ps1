$resourceGroupName =  $args[0]
$azureDataFactoryName = $args[1]



Invoke-AzDataFactoryV2Pipeline `
    -azureDataFactoryName $azureDataFactoryName `
    -ResourceGroupName $resourceGroupName `
    -PipelineName 'ExecuteAllCopyDataPipelinesWithCustomDate'