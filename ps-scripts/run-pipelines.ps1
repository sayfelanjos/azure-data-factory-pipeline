$resourceGroupName =  $args[0]
$azureDataFactoryName = $args[1]



Invoke-AzDataFactoryV2Pipeline `
    -DataFactoryName $azureDataFactoryName `
    -ResourceGroupName $resourceGroupName `
    -PipelineName 'ExecuteAllCustomDatePipelines'