$pipelinesPath = '.\bicep\copyPipelines'
$pipeLines = Get-ChildItem $pipelinesPath
$resourceGroupName =  $args[0]
$dataFactoryName = $args[1]



foreach ($pl in $pipelines) {
    Invoke-AzDataFactoryV2Pipeline `
        -DataFactoryName $dataFactoryName `
        -ResourceGroupName $resourceGroupName `
        -PipelineName $pl.BaseName
}