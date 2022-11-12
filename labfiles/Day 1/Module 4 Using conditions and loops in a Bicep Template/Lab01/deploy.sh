#!/bin/sh
resourceGroupName="rg-iac-bicep-labs"
location="EastUS2"

##Deploy resource group and provision resources
az deployment group create \
    --resource-group $resourceGroupName \
    --template-file "main.bicep" \
    --parameters "lab.parameters.json"  ##--what-if
