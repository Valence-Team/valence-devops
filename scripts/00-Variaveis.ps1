$RG        = "rg-valence-rm562396"
$LOCAL     = "mexicocentral"
$PLANO     = "plan-valence-rm562396"
$WEBAPP    = "valence-rm562396"
$SQLSERVER = "sqlserver-valence-rm562396"
$SQLDB     = "bd_valence"
$SQLUSER   = "valenceadmin"

$SQLPASS   = [System.Net.NetworkCredential]::new("", (Read-Host "Senha do SQL Server" -AsSecureString)).Password
$JWTSECRET = [System.Net.NetworkCredential]::new("", (Read-Host "Segredo do JWT" -AsSecureString)).Password
