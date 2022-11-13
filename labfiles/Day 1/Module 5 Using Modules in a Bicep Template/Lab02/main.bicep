//REMOTE Module Reference
@description('Optional. The location to deploy into')
param location string = resourceGroup().location

@description('Generate random storage account name')
param storageAccountName string = 'm5l2sa${uniqueString(resourceGroup().id)}'

module storage 'br:acrm5l2xxx.azurecr.io/bicep/modules/storage/storageaccounts:v1.0.0'= {
  name:'demostg'
  params:{
    storageAccountName:storageAccountName
    location:location
  }  
}
