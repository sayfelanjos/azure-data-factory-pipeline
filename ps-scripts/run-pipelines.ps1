$resourceGroupName =  $args[0]
$dataFactoryName = $args[1]



Invoke-AzDataFactoryV2Pipeline `
    -DataFactoryName $dataFactoryName `
    -ResourceGroupName $resourceGroupName `
    -PipelineName 'ExecuteAllCopyDataPipelines'