# AVM Module for Azure Key Vault
module "kv" {
    source = "Azure/avm-res-keyvault-vault/azurerm"
    version = "0.10.0"

    name = module.naming.keyvault.name
    location = var.location
    resource_group_name = var.resource_group_name
    tenant_id = data.azurerm_client_config.this.tenant_id
}