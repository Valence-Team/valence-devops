if (-not (Get-Command sqlcmd -ErrorAction SilentlyContinue)) {
    throw "sqlcmd não encontrado. Execute este script no Azure Cloud Shell em PowerShell."
}

$env:SQLCMDPASSWORD = $SQLPASS
try {
    sqlcmd -b -S "$SQLSERVER.database.windows.net" -d $SQLDB -U $SQLUSER -i (Join-Path $PSScriptRoot 'script-bd.sql')
    if ($LASTEXITCODE -ne 0) {
        throw "Falha ao executar o script-bd.sql no banco $SQLDB."
    }

    # Tabelas criadas
    sqlcmd -b -S "$SQLSERVER.database.windows.net" -d $SQLDB -U $SQLUSER -Q "SELECT name FROM sys.tables WHERE name LIKE 'TB[_]%' ORDER BY name"
    if ($LASTEXITCODE -ne 0) {
        throw "Falha ao listar as tabelas do banco $SQLDB."
    }
}
finally {
    Remove-Item Env:\SQLCMDPASSWORD -ErrorAction SilentlyContinue
}
