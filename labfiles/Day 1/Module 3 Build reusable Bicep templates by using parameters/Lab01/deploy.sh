#!/bin/sh
resourceGroupName="learn-1ba5fc46-3e83-42a0-b031-3a654bdcb2fb"
location="westus"

##Deploy resource group and provision resources
az deployment group create \
    --resource-group $resourceGroupName \
    --template-file "main.bicep" \
    --parameters storageAccountType=dummy