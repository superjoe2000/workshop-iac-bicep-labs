
@description('Generated from /subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Compute/virtualMachines/ToyTruckServer')
resource ToyTruckServer 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: 'ToyTruckServer'
  location: 'westus'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-minimal-focal'
        sku: 'minimal-20_04-lts'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: 'ToyTruckServer_OsDisk_1_91f8b3613f4a4d29bd96c6a496a7a470'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: '/subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Compute/disks/ToyTruckServer_OsDisk_1_91f8b3613f4a4d29bd96c6a496a7a470'
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
    }
    osProfile: {
      computerName: 'ToyTruckServer'
      adminUsername: 'toytruckadmin'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: '/subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Network/networkInterfaces/toytruckserver72'
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

