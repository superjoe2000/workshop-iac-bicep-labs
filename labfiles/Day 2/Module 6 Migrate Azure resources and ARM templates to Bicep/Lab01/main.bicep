var storageContainerPath = 'https://saassessment123.blob.core.windows.net/dbassessments'
var dbServer = 'toytruckserver'
param location string = resourceGroup().location

resource dbServer_resource 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: dbServer
  location: location
  //kind: 'v12.0'
  properties: {
    administratorLogin: 'toytruckadmin'
    administratorLoginPassword: 'stupidpassword123456#$%'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Disabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource dbServer_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2022-05-01-preview' = {
  parent: dbServer_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource dbServer_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: dbServer_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

//resource dbServer_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
//  parent: dbServer_resource
//  name: 'DbParameterization'
//  properties: {
//    autoExecuteValue: 'Disabled'
//  }
//}

//resource dbServer_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
//  parent: dbServer_resource
//  name: 'DefragmentIndex'
//  properties: {
//    autoExecuteValue: 'Disabled'
//  }
//}

//resource dbServer_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
//  parent: dbServer_resource
//  name: 'DropIndex'
//  properties: {
//    autoExecuteValue: 'Disabled'
//  }
//}

//resource dbServer_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
//  parent: dbServer_resource
//  name: 'ForceLastGoodPlan'
//  properties: {
//    autoExecuteValue: 'Enabled'
//  }
//}

resource Microsoft_Sql_servers_auditingPolicies_dbServer_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: dbServer_resource
  name: 'Default'
  //location: 'West US 3'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_dbServer_Default 'Microsoft.Sql/servers/auditingSettings@2022-05-01-preview' = {
  parent: dbServer_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: 'fee92509-9f8a-4e9d-8be1-a9c00897e0b3'
  }
}

resource Microsoft_Sql_servers_connectionPolicies_dbServer_default 'Microsoft.Sql/servers/connectionPolicies@2022-05-01-preview' = {
  parent: dbServer_resource
  name: 'default'
  //location: 'westus3'
  properties: {
    connectionType: 'Default'
  }
}

//  '/subscriptions/fee92509-9f8a-4e9d-8be1-a9c00897e0b3/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
resource maintenanceConfiguration 'Microsoft.Maintenance/publicMaintenanceConfigurations@2022-07-01-preview' existing = {
  name: 'SQL_Default'
  scope: subscription('fee92509-9f8a-4e9d-8be1-a9c00897e0b3')
}

resource dbServer_toytruckdb 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: dbServer_resource
  name: 'toytruckdb'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 10
  }
  //kind: 'v12.0,user'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 268435456000
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Local'
    maintenanceConfigurationId: maintenanceConfiguration.id
    isLedgerOn: false
    preferredEnclaveType: 'Default'
  }
}

resource dbServer_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2022-05-01-preview' = {
  name: '${dbServer}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    dbServer_resource
  ]
}

//resource Microsoft_Sql_servers_databases_auditingPolicies_dbServer_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
//  name: '${dbServer}/master/Default'
//  //location: 'West US 3'
//  properties: {
//    auditingState: 'Disabled'
//  }
//  dependsOn: [
//    dbServer_resource
//  ]
//}

resource Microsoft_Sql_servers_databases_auditingSettings_dbServer_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2022-05-01-preview' = {
  name: '${dbServer}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: 'fee92509-9f8a-4e9d-8be1-a9c00897e0b3'
  }
  dependsOn: [
    dbServer_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_dbServer_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2022-05-01-preview' = {
  name: '${dbServer}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: 'fee92509-9f8a-4e9d-8be1-a9c00897e0b3'
  }
  dependsOn: [
    dbServer_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_dbServer_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2022-05-01-preview' = {
  name: '${dbServer}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    dbServer_resource
  ]
}

//resource dbServer_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2022-05-01-preview' = {
//  name: '${dbServer}/master/Current'
//  properties: {
//  }
//  dependsOn: [
//    dbServer_resource
//  ]
//}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_dbServer_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2022-05-01-preview' = {
  name: '${dbServer}/master/Default'
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
    dbServer_resource
  ]
}

//resource Microsoft_Sql_servers_databases_transparentDataEncryption_dbServer_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2022-05-01-preview' = {
//  name: '${dbServer}/master/Current'
//  properties: {
//    state: 'Disabled'
//  }
//  dependsOn: [
//    dbServer_resource
//  ]
//}

//resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_dbServer_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2022-05-01-preview' = {
//  name: '${dbServer}/master/Default'
//  properties: {
//    recurringScans: {
//      isEnabled: false
//      emailSubscriptionAdmins: true
//    }
//  }
//  dependsOn: [
//    dbServer_resource
//  ]
//}

resource Microsoft_Sql_servers_devOpsAuditingSettings_dbServer_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2022-05-01-preview' = {
  parent: dbServer_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: 'fee92509-9f8a-4e9d-8be1-a9c00897e0b3'
  }
}

resource dbServer_current 'Microsoft.Sql/servers/encryptionProtector@2022-05-01-preview' = {
  parent: dbServer_resource
  name: 'current'
  //kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_dbServer_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2022-05-01-preview' = {
  parent: dbServer_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: 'fee92509-9f8a-4e9d-8be1-a9c00897e0b3'
  }
}

//resource dbServer_ServiceManaged 'Microsoft.Sql/servers/keys@2022-05-01-preview' = {
//  parent: dbServer_resource
//  name: 'ServiceManaged'
//  //kind: 'servicemanaged'
//  properties: {
//    serverKeyType: 'ServiceManaged'
//  }
//}

//resource Microsoft_Sql_servers_securityAlertPolicies_dbServer_Default 'Microsoft.Sql/servers/securityAlertPolicies@2022-05-01-preview' = {
//  parent: dbServer_resource
//  name: 'Default'
//  properties: {
//    state: 'Disabled'
//    disabledAlerts: [
//      ''
//    ]
//    emailAddresses: [
//      ''
//    ]
//    emailAccountAdmins: false
//    retentionDays: 0
//  }
//}

//resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_dbServer_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2022-05-01-preview' = {
//  parent: dbServer_resource
//  name: 'Default'
//  properties: {
//    state: 'Disabled'
//  }
//}

//resource Microsoft_Sql_servers_vulnerabilityAssessments_dbServer_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2022-05-01-preview' = {
//  parent: dbServer_resource
//  name: 'Default'
//  properties: {
//    recurringScans: {
//      isEnabled: false
//      emailSubscriptionAdmins: true
//    }
//    storageContainerPath: storageContainerPath
//  }
//}

resource dbServer_toytruckdb_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2022-05-01-preview' = {
  parent: dbServer_toytruckdb
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

//resource dbServer_toytruckdb_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
//  parent: dbServer_toytruckdb
//  name: 'CreateIndex'
//  properties: {
//    autoExecuteValue: 'Disabled'
//  }
//}

//resource dbServer_toytruckdb_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
//  parent: dbServer_toytruckdb
//  name: 'DbParameterization'
//  properties: {
//    autoExecuteValue: 'Disabled'
//  }
//}

//resource dbServer_toytruckdb_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
//  parent: dbServer_toytruckdb
//  name: 'DefragmentIndex'
//  properties: {
//    autoExecuteValue: 'Disabled'
//  }
//}

//resource dbServer_toytruckdb_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
//  parent: dbServer_toytruckdb
//  name: 'DropIndex'
//  properties: {
//    autoExecuteValue: 'Disabled'
//  }
//}

//resource dbServer_toytruckdb_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
//  parent: dbServer_toytruckdb
//  name: 'ForceLastGoodPlan'
//  properties: {
//    autoExecuteValue: 'Enabled'
//  }
//}

//resource Microsoft_Sql_servers_databases_auditingPolicies_dbServer_toytruckdb_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
//  parent: dbServer_toytruckdb
//  name: 'Default'
//  //location: 'West US 3'
//  properties: {
//    auditingState: 'Disabled'
//  }
//}

resource Microsoft_Sql_servers_databases_auditingSettings_dbServer_toytruckdb_Default 'Microsoft.Sql/servers/databases/auditingSettings@2022-05-01-preview' = {
  parent: dbServer_toytruckdb
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: 'fee92509-9f8a-4e9d-8be1-a9c00897e0b3'
  }
}

//resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_dbServer_toytruckdb_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2022-05-01-preview' = {
//  parent: dbServer_toytruckdb
//  name: 'default'
//  properties: {
//    weeklyRetention: 'PT0S'
//    monthlyRetention: 'PT0S'
//    yearlyRetention: 'PT0S'
//    weekOfYear: 0
//  }
//}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_dbServer_toytruckdb_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2022-05-01-preview' = {
  parent: dbServer_toytruckdb
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_dbServer_toytruckdb_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2022-05-01-preview' = {
  parent: dbServer_toytruckdb
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: 'fee92509-9f8a-4e9d-8be1-a9c00897e0b3'
  }
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_dbServer_toytruckdb_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2022-05-01-preview' = {
  parent: dbServer_toytruckdb
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

//resource dbServer_toytruckdb_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2022-05-01-preview' = {
//  parent: dbServer_toytruckdb
//  name: 'Current'
//  properties: {
//  }
//}

//resource Microsoft_Sql_servers_databases_securityAlertPolicies_dbServer_toytruckdb_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2022-05-01-preview' = {
//  parent: dbServer_toytruckdb
//  name: 'Default'
//  properties: {
//    state: 'Disabled'
//    disabledAlerts: [
//      ''
//    ]
//    emailAddresses: [
//      ''
//    ]
//    emailAccountAdmins: false
//    retentionDays: 0
//  }
//}

//resource Microsoft_Sql_servers_databases_transparentDataEncryption_dbServer_toytruckdb_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2022-05-01-preview' = {
//  parent: dbServer_toytruckdb
//  name: 'Current'
//  properties: {
//    state: 'Enabled'
//  }
//}

//resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_dbServer_toytruckdb_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2022-05-01-preview' = {
//  parent: dbServer_toytruckdb
//  name: 'Default'
//  properties: {
//    recurringScans: {
//      isEnabled: false
//      emailSubscriptionAdmins: true
//    }
//  }
//}
