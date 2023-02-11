# Module 7 Lab 02: Deploy resources to a multiple scopes by using modules

Follow lab guide: [Exercise - Deploy resources to a management group](https://learn.microsoft.com/en-au/training/modules/deploy-resources-scopes-bicep/7-exercise-deploy-management-group?pivots=cli)

```bash
https://learn.microsoft.com/en-au/training/modules/deploy-resources-scopes-bicep/7-exercise-deploy-management-group?pivots=cli
```

## Steps

1. Create a new main.bicep
2. Create a resource group
3. Add a module to create a VNet
4. Use the module in subscription deployment
5. Verify Bicep template
6. Deploy to template to Azure
7. Review and verify deployment
8.Cleanup resources

End 6 of 9

## Sandbox Lab

Because of limitations with the Sandbox accounts, this activity will fail:

```json
{"code": "AuthorizationFailed", "message": "The client 'admin@MngEnv024722.onmicrosoft.com' with object id '2c339018-9363-49ba-81bd-850e6e8580ec' does not have authorization to perform action 'Microsoft.Resources/deployments/validate/action' over scope '/subscriptions/fee92509-9f8a-4e9d-8be1-a9c00897e0b3' or the scope is invalid. If access was recently granted, please refresh your credentials."}
```
