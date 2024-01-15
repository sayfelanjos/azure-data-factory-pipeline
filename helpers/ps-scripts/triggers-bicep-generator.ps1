$pipelinesName = Get-ChildItem C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\copyPipelines
$triggersPath = 'C:\Users\saymo\eng4tech\neolude\LAB-NEOLUDE-DATAOPS\bicep\trigger'
$suffix = '.bicep'

foreach ($pl in $pipelinesName) {
    $triggerName = "$($pl.BaseName.Replace('_pl', ''))_tgr"
    $triggerTemplate = @"
@description('Data Factory Name')
param dataFactoryName string

param utcTime string = utcNow('u')
var startTime = dateTimeAdd(utcTime, '-PT2H58M')
var endTime = dateTimeAdd(startTime, 'PT1M30S')

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource azureDataFactoryTrigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  name: '$($triggerName)'
  parent: dataFactory
  properties: {
    type: 'ScheduleTrigger'
    pipelines: [
      {
        parameters: {}
        pipelineReference: {
          referenceName: '$($pl.BaseName)'
          type: 'PipelineReference'
        }
      }
    ]
    typeProperties: {
      recurrence: {
        frequency: 'Minute'
        endTime: endTime
        interval: 1
        startTime: startTime
        timeZone: 'E. South America Standard Time'
      }
    }
  }
}
"@
    Out-File -FilePath "$($triggersPath)\$($triggerName)$($suffix)" -InputObject $($triggerTemplate)
}
