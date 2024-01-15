$resourceGroupName = $args[0]
$serverName = $args[1]
$dbName = $args[2]
$adminLogin = $args[3]
# $adminPassword = ConvertTo-SecureString $args[4] -AsPlainText -Force
$adminPassword = $args[4]
$templatePath = '.\bicep\database\sqlServer.bicep'

$isPresent = Get-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName -ErrorAction SilentlyContinue
if ($isPresent) {
    Write-Host 'Server already exists!'
}else {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
        -TemplateFile $templatePath `
        -serverName $serverName `
        -dbName $dbName `
        -sqlServerAdminLogin $adminLogin `
        -sqlServerAdminPassword $adminPassword
}