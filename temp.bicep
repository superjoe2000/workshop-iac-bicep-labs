param virtualNetworks_ToyTruck_vnet_name string= 'ToyTruckServer-vnet'
param networkInterfaces_toytruckserver72_name string= 'toytruckserver72'
param publicIPAddresses_ToyTruckServer_ip_name string= 'ToyTruckServer-ip'
param networkSecurityGroups_ToyTruckServer_nsg_name string= 'ToyTruckServer-nsg'
param location string = resourceGroup().location
param servername string = 'ToyTruckServer'
param adminUsername string = 'toytruckadmin'
@secure()
param adminPassword string

@description('Generated from /subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Compute/virtualMachines/ToyTruckServer')
resource ToyTruckServer 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: servername
  location: location
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
          // id: resourceId('Microsoft.Compute/disks', 'ToyTruckServer_OsDisk_1_91f8b3613f4a4d29bd96c6a496a7a470') 
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
    }
    osProfile: {
      computerName: 'ToyTruckServer'
      adminUsername: adminUsername
      adminPassword: adminPassword
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
      //requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: toytruckservernic.id
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


@description('Generated from /subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Network/publicIPAddresses/ToyTruckServer-ip')
resource ToyTruckServerip 'Microsoft.Network/publicIPAddresses@2022-05-01' = {
  name: publicIPAddresses_ToyTruckServer_ip_name
  location: location
  properties: {
    // ipAddress: '20.66.109.44'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
}


@description('Generated from /subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Network/networkSecurityGroups/ToyTruckServer-nsg')
resource ToyTruckServernsg 'Microsoft.Network/networkSecurityGroups@2022-05-01' = {
  name: networkSecurityGroups_ToyTruckServer_nsg_name
  location: location
  properties: {
    securityRules: []
  }
}


@description('Generated from /subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Network/networkInterfaces/toytruckserver72')
resource toytruckservernic 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: networkInterfaces_toytruckserver72_name
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.3.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: ToyTruckServerip.id
            properties: {
              publicIPAddressVersion: 'IPv4'
              publicIPAllocationMethod: 'Dynamic'
              idleTimeoutInMinutes: 4
              ipTags: []
              deleteOption: 'Detach'
            }
            sku: {
              name: 'Basic'
              tier: 'Regional'
            }
          }
          subnet: {
            id: ToyTruckvnet.properties.subnets[0].id
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
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: ToyTruckServernsg.id
    }
    nicType: 'Standard'
    // allowPort25Out: true
  }
  location: location
  // kind: 'Regular'
  }




@description('Generated from /subscriptions/9fa642e3-4211-4d88-b4a4-effb9af9ed02/resourceGroups/ToyTruck/providers/Microsoft.Network/virtualNetworks/ToyTruck-vnet')
resource ToyTruckvnet 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: virtualNetworks_ToyTruck_vnet_name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.3.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.3.0.0/24'
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
