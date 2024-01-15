$workspace = 'C:\Users\saymo\eng4tech\neolude\NEOLUDE-BI'
$dataSets = Get-ChildItem "$($workspace)\armTemplates\datasets\*"
$linkedServiceName = 'sqldb-linked-service'
$folderName = 'tables'
$Suffix = '.bicep'
$dataFactoryName = 'dataFactoryName'

foreach ($ds in $dataSets) {
    $dataSetOutData = Get-Content "$($ds.FullName)\dataset\*" | ConvertFrom-Json
    $schema = $($dataSetOutData.properties.schema | ConvertTo-Json)
    $datasetTemplate = @"
@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: $($dataFactoryName)
}

resource sqlDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: '$($ds.BaseName)'
    parent: dataFactory
    properties: {
        annotations: []
        type: 'AzureSqlTable'
        linkedServiceName: {
            referenceName: '$($linkedServiceName)'
            type: 'LinkedServiceReference'
        }
        schema: $(($dataSetOutData.properties.schema.length -eq 0) ? '[]' : $schema)
        typeProperties: {
            table: '$($dataSetOutData.properties.typeProperties.table)'
            schema: '$($dataSetOutData.properties.typeProperties.schema)'
        }
        folder: {
            name: '$($folderName)'
        }
    }
}
"@
    Out-File -FilePath "$($workspace)\bicep\datasets\$($ds.BaseName)$($Suffix)" -InputObject $datasetTemplate
}


