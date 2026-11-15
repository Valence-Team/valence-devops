az group delete -n $RG --yes --no-wait
if ($LASTEXITCODE -ne 0) { throw "Falha ao solicitar a remoção do Resource Group $RG." }

Write-Host "Remoção do grupo de recursos $RG solicitada."
