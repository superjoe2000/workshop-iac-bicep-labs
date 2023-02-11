managementGroupId="SecretRND"
templateFile="main.bicep"
today=$(date +"%d-%b-%Y")
deploymentName="mg-scope-M7L3-"$today

az deployment mg create \
  --management-group-id $managementGroupId \
  --name $deploymentName \
  --location westus \
  --template-file $templateFile


az group create --resource-group ToyTruckM7L3 --location westus 

az deployment group create --resource-group ToyTruckM7L3 --template-file main.bicep --parameters main.parameters.production.json --mode complete