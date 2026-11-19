az webapp config appsettings set -g $RG -n $WEBAPP --output none --settings `
    "SPRING_PROFILES_ACTIVE=prod" `
    "SERVER_PORT=80" `
    "SPRING_DATASOURCE_URL=jdbc:sqlserver://$SQLSERVER.database.windows.net:1433;database=$SQLDB;encrypt=true;trustServerCertificate=false;loginTimeout=30;" `
    "SPRING_DATASOURCE_USERNAME=$SQLUSER" `
    "SPRING_DATASOURCE_PASSWORD=$SQLPASS" `
    "JWT_SECRET=$JWTSECRET"
