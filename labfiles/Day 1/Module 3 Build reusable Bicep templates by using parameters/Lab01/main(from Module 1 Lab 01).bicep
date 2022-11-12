@description('Location for the storage account.')
param location string = resourceGroup().location

@description('The name of the Storage Account')
param storageAccountName string = 'salab${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {}
}

output storageAccountName string = storageAccountName
output storageAccountId string = storageAccount.id
