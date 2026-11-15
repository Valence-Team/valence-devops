az webapp create -g $RG --plan $PLANO -n $WEBAPP --runtime "JAVA:21-java21"

az webapp config set -g $RG -n $WEBAPP --always-on true --generic-configurations healthCheckPath=/actuator/health/liveness

az webapp update -g $RG -n $WEBAPP --https-only true
