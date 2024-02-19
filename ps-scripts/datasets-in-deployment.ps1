$dataSetsPath = '.\bicep\dataSetIn'
$dataSets = Get-ChildItem $dataSetsPath
$resourceGroupName = $args[0]
$azureDataFactoryName = $args[1]


foreach ($ds in $dataSets) {
    New-AzResourceGroupDeployment -ResourceGroupName $($resourceGroupName) -TemplateFile $($ds.FullName) -azureDataFactoryName $($azureDataFactoryName)
}