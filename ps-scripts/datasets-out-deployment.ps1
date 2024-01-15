$dataSetsPath = '.\bicep\dataSetOut'
$dataSets = Get-ChildItem $dataSetsPath
$resourceGroupName = $args[0]
$dataFactoryName = $args[1]


foreach ($ds in $dataSets) {
    New-AzResourceGroupDeployment -ResourceGroupName $($resourceGroupName) -TemplateFile $($ds.FullName) -DataFactoryName $($dataFactoryName)
}


