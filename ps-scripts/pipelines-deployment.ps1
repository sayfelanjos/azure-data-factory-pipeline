$pipelinesPath = '.\bicep\pipelines'
$copyPipelinesPath = '.\bicep\copyPipelines'
$copyPipelines = Get-ChildItem $copyPipelinesPath
$resourceGroupName = $args[0]
$dataFactoryName = $args[1]
$updateStartDate = $args[2]

# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$($pipelinesPath)\contents_pl.bicep" -pipelineName 'contents_pl' -dataFactoryName $dataFactoryName
# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$($pipelinesPath)\contents_pl_2.bicep" -pipelineName 'contents_pl_2' -dataFactoryName $dataFactoryName
# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$($pipelinesPath)\course_permissions_pl.bicep" -pipelineName 'course_permissions_pl' -dataFactoryName $dataFactoryName
# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$($pipelinesPath)\courses_pl.bicep" -pipelineName 'courses_pl' -dataFactoryName $dataFactoryName
# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$($pipelinesPath)\general_pl.bicep" -pipelineName 'general_pl' -dataFactoryName $dataFactoryName
# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$($pipelinesPath)\execute_pl.bicep" -pipelineName 'execute_pl' -dataFactoryName $dataFactoryName
# New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$($pipelinesPath)\execute_copyPipelines_pl.bicep" -pipelineName 'execute_pl' -dataFactoryName $dataFactoryName

foreach ($pl in $copyPipelines) {
    New-AzResourceGroupDeployment `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $pl.FullName `
        -dataFactoryName $dataFactoryName `
        -updateStartDate $updateStartDate `
        -ErrorAction SilentlyContinue
}

foreach ($pl in $pipelinesPath) {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile $pl.FullName `
    -dataFactoryName $dataFactoryName `
    -updateStartDate $updateStartDate `
    -ErrorAction SilentlyContinue
}

