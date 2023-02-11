managementGroupId="SecretRND"
templateFile="main.bicep"
today=$(date +"%d-%b-%Y")
deploymentName="mg-scope-M7L2-"$today

az deployment mg create \
  --management-group-id $managementGroupId \
  --name $deploymentName \
  --location westus \
  --template-file $templateFile