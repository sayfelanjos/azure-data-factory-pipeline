$workspace = 'C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS'
$dataSets = Get-Content "$($workspace)\ps-scripts\end-points.txt"
$linkedServiceName = 'rest-api-linked-service'
$folderName = 'rest_endpoints'
$Suffix = '_ep.bicep'
$dataFactoryName = 'dataFactoryName'

foreach ($ds in $dataSets) {
    $datasetTemplate = @"
@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
    name: $($dataFactoryName)
}

resource symbolicname 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
    name: '$($ds)_ep'
    parent: dataFactory
    properties: {
        annotations: []
        type: 'RestResource'
        linkedServiceName: {
            referenceName: '$($linkedServiceName)'
            type: 'LinkedServiceReference'
        }
        schema: { }
        typeProperties: {
            relativeUrl: '$("/$($ds)")'
        }
        folder: {
            name: '$($folderName)'
        }
    }
}    
"@
    Out-File -FilePath "$($workspace)\bicep\dataSetIn\$($ds)$($Suffix)" -InputObject $datasetTemplate
}


