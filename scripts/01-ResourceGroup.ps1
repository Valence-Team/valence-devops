az provider register --namespace Microsoft.Web
az provider register --namespace Microsoft.Sql

az group create -n $RG -l $LOCAL
