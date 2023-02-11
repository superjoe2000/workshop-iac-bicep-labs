# Module 7 Lab 01: Convert and Migrate resources

Follow lab guide: [Exercise - Deploy a subscription-scoped resource](https://learn.microsoft.com/en-au/training/modules/deploy-resources-scopes-bicep/4-exercise-deploy-subscription-scoped-resource?pivots=cli)

```bash
https://learn.microsoft.com/en-au/training/modules/deploy-resources-scopes-bicep/4-exercise-deploy-subscription-scoped-resource?pivots=cli
```

## Steps

1. Create a new main.bicep
2. Set target scope to subscription
3. Add a resource group resource
4. Add name and location as params
5. Create a deploy.ps1 script
6. Set Azure context 
7. Add variables
8. Deploy to Azure
9. Review results

End Unit 4 of 9

## Sandbox Lab

Because of limitations with the Sandbox accounts, this activity will fail:

```json
{"code": "AuthorizationFailed", "message": "The client 'admin@MngEnv024722.onmicrosoft.com' with object id '2c339018-9363-49ba-81bd-850e6e8580ec' does not have authorization to perform action 'Microsoft.Resources/deployments/validate/action' over scope '/subscriptions/fee92509-9f8a-4e9d-8be1-a9c00897e0b3' or the scope is invalid. If access was recently granted, please refresh your credentials."}
```
