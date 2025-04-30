# AVM Module for Azure Key Vault
module "kv" {
    source = "Azure/avm-res-keyvault-vault/azurerm"
    version = ">= 0.10.0"

    name = var.KEYVAULT_NAME
    location = var.location
    resource_group_name = var.resource_group_name
    tenant_id = data.azurerm_client_config.this.tenant_id
    sku_name = "standard"
    enabled_for_deployment = true
    public_network_access_enabled = true # Required for Ansible

    network_acls = {
        bypass = "AzureServices"
        default_action = "Allow"

        ip_rules = []
        virtual_network_rules = []
    }

    role_assignments = {
        keyvault_admin = {
            role_definition_id_or_name       = "Key Vault Administrator"
            principal_id                     = data.azuread_user.this.object_id
            principal_type                   = "User"
            skip_service_principal_aad_check = true
        }
    }

    tags = var.tags
}