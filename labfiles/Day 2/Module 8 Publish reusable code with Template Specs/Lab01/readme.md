# Module 8 Lab 01: Create and deploy a template spec

<!-- markdownlint-disable MD036 -->

This lab contains the Sandbox

Follow lab guide: [Exercise - Create and deploy a template spec](https://learn.microsoft.com/en-au/training/modules/arm-template-specs/5-exercise-create-deploy-template-spec?pivots=bicepcli)

```bash
https://learn.microsoft.com/en-au/training/modules/arm-template-specs/5-exercise-create-deploy-template-spec?pivots=bicepcli
```

*Note: This lab guide contains an Azure Sandbox*

## Steps

1. Create a Bicep Template
2. Refactor Code – add params
3. Publish the Template Spec
4. Review Azure Portal
5. Deploy the Template Spec
6. Verify the deployment
7. Review results

End 6 of 9

## Sandbox Lab

### AzCLI

```bash
az ts show \
  --resource-group learn-8d79bf06-7278-4cbd-aba7-6329ced10992 \
  --name ToyCosmosDBAccount \
  --version 1.0
```

```bash
az ts export \
  --resource-group learn-8d79bf06-7278-4cbd-aba7-6329ced10992 \
  --name ToyCosmosDBAccount \
  --version 1.0 \
  --output-folder ./mytemplate
```
