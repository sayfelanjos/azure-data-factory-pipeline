$pipelines = Get-ChildItem -Path 'C:\Users\saymo\eng4tech\neolude\NEOLUDE-BI\bicep\copyDataPipelinesWithAutoSetDate'

foreach ($pl in $pipelines) {
    $file =  Get-Content -Path "$($pl.FullName)"
    $file -replace  'DataWith', '' | Set-Content -Path "$($pl.FullName)"
}