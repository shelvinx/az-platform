# AVM Module for Azure Key Vault
module "kv" {
    source = "Azure/avm-res-keyvault-vault/azurerm"
    version = "0.10.0"

    name = "module.naming.keyvault.name"
    location = var.location
    resource_group_name = var.resource_group_name
    tenant_id = var.ARM_TENANT_ID
}