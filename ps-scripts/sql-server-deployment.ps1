$resourceGroupName = $args[0]
$serverName = $args[1]
$dbName = $args[2]
$adminLogin = $args[3]
$adminPassword = $args[4]
$templatePath = '.\bicep\database\sqlServer.bicep'

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templatePath `
    -serverName $serverName `
    -dbName $dbName `
    -sqlServerAdminLogin $adminLogin `
    -sqlServerAdminPassword $(ConvertTo-SecureString -String $adminPassword -AsPlainText -Force)
