#!/bin/sh
resourceGroupName="rg-iac-bicep-labs"
location="EastUS2"

##Deploy resource group and provision resources
az deployment group create \
    --resource-group "ToyTruck2" \
    --template-file "temp.bicep" --what-if
