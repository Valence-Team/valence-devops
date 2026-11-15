az provider register --namespace Microsoft.Web
if ($LASTEXITCODE -ne 0) { throw "Falha ao registrar o provedor Microsoft.Web." }

az provider register --namespace Microsoft.Sql
if ($LASTEXITCODE -ne 0) { throw "Falha ao registrar o provedor Microsoft.Sql." }

az group create -n $RG -l $LOCAL
if ($LASTEXITCODE -ne 0) { throw "Falha ao criar o Resource Group $RG." }
