#Changes the AAD Admin account for all SQL servers if the current displayname is not equal to $PrincipalDisplayName
Connect-AzAccount | Out-Null
$servers = Get-AzSqlServer
$PrincipalDisplayName = ""
foreach($server in $servers){
    $AdminID = (Get-AzSqlServer -ServerName $server.ServerName).Administrators.Login
    if($AdminID -ne $PrincipalDisplayName){
        Set-AzSqlServerActiveDirectoryAdministrator -DisplayName $PrincipalDisplayName -ServerName $($server.ServerName) -ResourceGroupName $server.ResourceGroupName
    }
}