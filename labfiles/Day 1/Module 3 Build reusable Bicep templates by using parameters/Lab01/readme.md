# Module 3: Build reusable Bicep templates by using parameters

- [Module 3: Build reusable Bicep templates by using parameters](#module-3-build-reusable-bicep-templates-by-using-parameters)
  - [Lab01](#lab01)
    - [Modify storage account bicep template](#modify-storage-account-bicep-template)
    - [Add parameters and variables](#add-parameters-and-variables)
    - [Re-deploy resources](#re-deploy-resources)
    - [Review results](#review-results)

## Lab01

### Modify storage account bicep template

The main.bicep from Module 1 Lab01 will be modified.

```bicep
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
```

### Add parameters and variables

Add the storageAccountType parameter to your template. The default value is set as 'Standard_LRS'.

```bicep
@description('Storage Account type')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param storageAccountType string = 'Standard_LRS'
```

Change the hard-coded sku object name to reference the new parameter.

Your main.bicep will now look like this:

```bicep
@description('Storage Account type')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param storageAccountType string = 'Standard_LRS'

@description('Location for the storage account.')
param location string = resourceGroup().location

@description('The name of the Storage Account')
param storageAccountName string = 'salab${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {}
}

output storageAccountName string = storageAccountName
output storageAccountId string = storageAccount.id
```

### Re-deploy resources

Ensure that you are working in the proper lab subdirectory.

You can use the 'deploy.sh' bash script to deploy or use this command:

```bash
az deployment group create --resource-group "rg-iac-bicep-labs" --template-file "main.bicep"
```

### Review results

In your browser Azure portal tab, you should see no changes.

You have successfully completed the Lab.
