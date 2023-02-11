@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param servers_toytruckserver_name string = 'toytruckserver'

resource servers_toytruckserver_name_resource 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: servers_toytruckserver_name
  location: 'westus3'
  kind: 'v12.0'
  properties: {
    administratorLogin: 'toytruckadmin'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Disabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource servers_toytruckserver_name_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource servers_toytruckserver_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_toytruckserver_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_toytruckserver_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_toytruckserver_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_toytruckserver_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_servers_toytruckserver_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_toytruckserver_name_resource
  name: 'Default'
  location: 'West US 3'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_toytruckserver_name_Default 'Microsoft.Sql/servers/auditingSettings@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_toytruckserver_name_default 'Microsoft.Sql/servers/connectionPolicies@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'default'
  location: 'westus3'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_toytruckserver_name_toytruckdb 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'toytruckdb'
  location: 'westus3'
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 10
  }
  kind: 'v12.0,user'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 268435456000
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Local'
    maintenanceConfigurationId: '/subscriptions/1617255f-dca1-4e22-bbf8-d3427fdb99b5/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    preferredEnclaveType: 'Default'
  }
}

resource servers_toytruckserver_name_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_toytruckserver_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_toytruckserver_name}/master/Default'
  location: 'West US 3'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_toytruckserver_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_toytruckserver_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_toytruckserver_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource servers_toytruckserver_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Current'
  properties: {
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_toytruckserver_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_toytruckserver_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_toytruckserver_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2022-05-01-preview' = {
  name: '${servers_toytruckserver_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_toytruckserver_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_toytruckserver_name_current 'Microsoft.Sql/servers/encryptionProtector@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_toytruckserver_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_toytruckserver_name_ServiceManaged 'Microsoft.Sql/servers/keys@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_toytruckserver_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_servers_toytruckserver_name_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_toytruckserver_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_resource
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource servers_toytruckserver_name_toytruckdb_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource servers_toytruckserver_name_toytruckdb_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource servers_toytruckserver_name_toytruckdb_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource servers_toytruckserver_name_toytruckdb_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource servers_toytruckserver_name_toytruckdb_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource servers_toytruckserver_name_toytruckdb_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_toytruckserver_name_toytruckdb_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'Default'
  location: 'West US 3'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_toytruckserver_name_toytruckdb_Default 'Microsoft.Sql/servers/databases/auditingSettings@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_toytruckserver_name_toytruckdb_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_toytruckserver_name_toytruckdb_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_toytruckserver_name_toytruckdb_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_toytruckserver_name_toytruckdb_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource servers_toytruckserver_name_toytruckdb_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'Current'
  properties: {
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_toytruckserver_name_toytruckdb_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_toytruckserver_name_toytruckdb_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_toytruckserver_name_toytruckdb_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2022-05-01-preview' = {
  parent: servers_toytruckserver_name_toytruckdb
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [

    servers_toytruckserver_name_resource
  ]
}