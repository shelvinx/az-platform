# Azure Platform Terraform Module

Azure Permanent Resources

## Features

- **Resource Group Management**: Standardized resource group
- **User-Assigned Managed Identities**: Secure identity management for virtual machines and other resources
- **Key Vault Integration**: Secure secret management with Azure Key Vault
- **Network Hub Integration**: Centralized networking components (if `avm.network-hub.tf` is used)
- **Automation**: Integration with Azure Automation for operational tasks

## Outputs

- `resource_group_id`: The ID of the created resource group
- `policy_definition_id`: The ID of the created policy definition
- `user_assigned_identity_id`: The ID of the created user-assigned managed identity