$appSettings = @(
    "SPRING_PROFILES_ACTIVE=prod"
    "SERVER_PORT=80"
    "SPRING_DATASOURCE_URL=jdbc:sqlserver://$SQLSERVER.database.windows.net:1433;database=$SQLDB;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"
    "SPRING_DATASOURCE_USERNAME=$SQLUSER"
    "SPRING_DATASOURCE_PASSWORD=$SQLPASS"
    "JWT_SECRET=$JWTSECRET"
    "JWT_EXPIRATION_MINUTES=120"
    "LLM_BASE_URL=https://api.groq.com/openai"
    "LLM_MODEL=openai/gpt-oss-120b"
    "IA_TIMEOUT_SECONDS=10"
    "IA_CONFIANCA_MINIMA=0.6"
    "ALERTA_RAIO_KM=10"
    "FOTOS_DIR=/home/data/fotos"
)

# Opcionais
if ($LLMAPIKEY) { $appSettings += "LLM_API_KEY=$LLMAPIKEY" }
if ($RABBITMQURI) { $appSettings += "RABBITMQ_URI=$RABBITMQURI" }
if ($IAAPIKEY) { $appSettings += "IA_API_KEY=$IAAPIKEY" }

az webapp config appsettings set -g $RG -n $WEBAPP --output none --settings $appSettings
