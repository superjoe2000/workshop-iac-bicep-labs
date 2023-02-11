templateFile="main.bicep"
today=$(date +"%d-%b-%Y")
deploymentName="sub-scope-M7L1-"$today

az deployment sub create \
    --name $deploymentName \
    --location westus \
    --template-file $templateFile