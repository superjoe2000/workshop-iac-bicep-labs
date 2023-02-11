# Module 7 Lab 03: Deploy resources to a Management group (Advanced)

Follow lab guide: [Exercise - Convert and migrate resources](https://learn.microsoft.com/en-au/training/modules/migrate-azure-resources-bicep/3-exercise-convert-migrate-resources?pivots=cli)

```bash
https://learn.microsoft.com/en-au/training/modules/migrate-azure-resources-bicep/3-exercise-convert-migrate-resources?pivots=cli
```

## Steps

1. Create a management group
2. Create a Bicep template to deploy to management group
3. Add a policy definition
4. Add a policy assignment
5. Verify Bicep template
6. Deploy template to Azure
7. Review and verify deployment
8. Cleanup resources

## Sandbox Lab

Because of limitations with the Sandbox accounts, this activity will fail:

```json
{"code": "AuthorizationFailed", "message": "The client 'admin@MngEnv024722.onmicrosoft.com' with object id '2c339018-9363-49ba-81bd-850e6e8580ec' does not have authorization to perform action 'Microsoft.Resources/deployments/validate/action' over scope '/subscriptions/fee92509-9f8a-4e9d-8be1-a9c00897e0b3' or the scope is invalid. If access was recently granted, please refresh your credentials."}
```
