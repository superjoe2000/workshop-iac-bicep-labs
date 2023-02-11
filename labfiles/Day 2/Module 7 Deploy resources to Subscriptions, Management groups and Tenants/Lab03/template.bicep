param virtualMachines_ToyTruckServer_name string = 'ToyTruckServer'
param networkInterfaces_toytruckserver900_name string = 'toytruckserver900'
param publicIPAddresses_ToyTruckServer_ip_name string = 'ToyTruckServer-ip'
param networkSecurityGroups_ToyTruckServer_nsg_name string = 'ToyTruckServer-nsg'
param virtualNetworks_ToyTruckServer_group_vnet_name string = 'ToyTruckServer_group-vnet'

resource publicIPAddresses_ToyTruckServer_ip_name_resource 'Microsoft.Network/publicIPAddresses@2022-01-01' = {
  name: publicIPAddresses_ToyTruckServer_ip_name
  location: 'westus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '20.228.98.19'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource virtualMachines_ToyTruckServer_name_resource 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: virtualMachines_ToyTruckServer_name
  location: 'westus'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: '20_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_ToyTruckServer_name}_disk1_94c5b40b4e364ecc8946e0283b79c8a8'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_ToyTruckServer_name}_disk1_94c5b40b4e364ecc8946e0283b79c8a8')
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_ToyTruckServer_name
      adminUsername: 'toytruckadmin'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_toytruckserver900_name_resource.id
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

resource networkSecurityGroups_ToyTruckServer_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2022-01-01' = {
  name: networkSecurityGroups_ToyTruckServer_nsg_name
  location: 'westus'
  properties: {
    securityRules: [
      {
        name: 'SSH'
        id: networkSecurityGroups_ToyTruckServer_nsg_name_SSH.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 300
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_ToyTruckServer_nsg_name_SSH 'Microsoft.Network/networkSecurityGroups/securityRules@2022-01-01' = {
  name: '${networkSecurityGroups_ToyTruckServer_nsg_name}/SSH'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 300
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_ToyTruckServer_nsg_name_resource
  ]
}

resource virtualNetworks_ToyTruckServer_group_vnet_name_resource 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: virtualNetworks_ToyTruckServer_group_vnet_name
  location: 'westus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.4.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        id: virtualNetworks_ToyTruckServer_group_vnet_name_default.id
        properties: {
          addressPrefix: '10.4.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_ToyTruckServer_group_vnet_name_default 'Microsoft.Network/virtualNetworks/subnets@2022-01-01' = {
  name: '${virtualNetworks_ToyTruckServer_group_vnet_name}/default'
  properties: {
    addressPrefix: '10.4.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_ToyTruckServer_group_vnet_name_resource
  ]
}

resource networkInterfaces_toytruckserver900_name_resource 'Microsoft.Network/networkInterfaces@2022-01-01' = {
  name: networkInterfaces_toytruckserver900_name
  location: 'westus'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_toytruckserver900_name_resource.id}/ipConfigurations/ipconfig1'
        etag: 'W/"4e4f7f04-454a-4ed4-8e28-722a46fe07b9"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.4.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            name: 'ToyTruckServer-ip'
            id: publicIPAddresses_ToyTruckServer_ip_name_resource.id
            properties: {
              provisioningState: 'Succeeded'
              resourceGuid: '4b2d0f90-6e90-46c8-9bdb-ad059d63a19e'
              publicIPAddressVersion: 'IPv4'
              publicIPAllocationMethod: 'Dynamic'
              idleTimeoutInMinutes: 4
              ipTags: []
              ipConfiguration: {
                id: '${networkInterfaces_toytruckserver900_name_resource.id}/ipConfigurations/ipconfig1'
              }
              deleteOption: 'Detach'
            }
            type: 'Microsoft.Network/publicIPAddresses'
            sku: {
              name: 'Basic'
              tier: 'Regional'
            }
          }
          subnet: {
            id: virtualNetworks_ToyTruckServer_group_vnet_name_default.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: true
    enableIPForwarding: false
    networkSecurityGroup: {
      id: networkSecurityGroups_ToyTruckServer_nsg_name_resource.id
    }
    nicType: 'Standard'
  }
}