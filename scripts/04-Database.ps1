az sql server create -n $SQLSERVER -g $RG -l $LOCAL --admin-user $SQLUSER --admin-password $SQLPASS --output none
if ($LASTEXITCODE -ne 0) { throw "Falha ao criar o servidor SQL $SQLSERVER." }

az sql db create -g $RG --server $SQLSERVER -n $SQLDB --service-objective Basic --backup-storage-redundancy Local
if ($LASTEXITCODE -ne 0) { throw "Falha ao criar o banco $SQLDB." }

# Firewall
az sql server firewall-rule create -g $RG --server $SQLSERVER -n AllowAzureServices --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0
if ($LASTEXITCODE -ne 0) { throw "Falha ao criar a regra de firewall AllowAzureServices." }

$ipLocal = (Invoke-RestMethod "https://api.ipify.org?format=json").ip
az sql server firewall-rule create -g $RG --server $SQLSERVER -n permitir-cliente-local --start-ip-address $ipLocal --end-ip-address $ipLocal
if ($LASTEXITCODE -ne 0) { throw "Falha ao criar a regra de firewall permitir-cliente-local." }
