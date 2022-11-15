Connect-AzAccount | Out-Null
$servers = Get-AzSqlServer
$PrincipalDisplayName = ""
foreach($server in $servers){
    $AdminID = (Get-AzSqlServer -ServerName $server.ServerName).Administrators.Login
    if($AdminID -ne $PrincipalDisplayName){
        Set-AzSqlServerActiveDirectoryAdministrator -DisplayName $PrincipalDisplayName -ServerName $($server.ServerName) -ResourceGroupName $server.ResourceGroupName
    }
}