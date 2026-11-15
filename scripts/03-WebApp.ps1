az webapp create -g $RG --plan $PLANO -n $WEBAPP --runtime "JAVA:21-java21"
if ($LASTEXITCODE -ne 0) { throw "Falha ao criar o Web App $WEBAPP." }

az webapp config set -g $RG -n $WEBAPP --always-on true --generic-configurations healthCheckPath=/actuator/health/liveness
if ($LASTEXITCODE -ne 0) { throw "Falha ao configurar Always On e health check no Web App $WEBAPP." }

az webapp update -g $RG -n $WEBAPP --https-only true
if ($LASTEXITCODE -ne 0) { throw "Falha ao ativar só HTTPS no Web App $WEBAPP." }
