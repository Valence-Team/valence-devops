az appservice plan create -n $PLANO -g $RG --is-linux --sku B1 --location $LOCAL
if ($LASTEXITCODE -ne 0) { throw "Falha ao criar o plano $PLANO." }
