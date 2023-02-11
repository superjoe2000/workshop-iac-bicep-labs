#!/bin/sh
resourceGroupName="rg-iac-bicep-labs"
location="EastUS2"
acrname="acrm5l2xyz"

##Version release tag f
moduleReleaseVersion="v1.0.0"

##Publish Modules to ACR 

###Create the ACR
az deployment group create \
    --resource-group $resourceGroupName \
    --template-file "acr-main.bicep" \

###Publish Storage Account module
az bicep publish --file 'storage-module.bicep' --target br:$acrname.azurecr.io/bicep/modules/storage/storageaccounts:$moduleReleaseVersion
