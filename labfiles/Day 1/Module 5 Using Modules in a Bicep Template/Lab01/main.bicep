//LOCAL Module Reference
@description('Optional. The location to deploy into')
param location string = resourceGroup().location


@description('Generate random storage account name')
param storageAccountName string = 'm5l1sa${uniqueString(resourceGroup().id)}'

module storagemodule './storage-module.bicep' = {  
  name:'stgmod'
  params:{
    storageAccountName:storageAccountName
    location:location
  }
}
