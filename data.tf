# Retrieves Tenant ID for the Key Vault deployment.
data "azurerm_client_config" "this" {}

# Retrieves the Admin User UPN for Role Assignment
data "azuread_user" "user_admin" {
  user_principal_name = var.UPN_ADMIN
}

# Retrieves the User Assigned Managed Identity for Role Assignment
# Fails if the UAI doesn't exist
data "azurerm_user_assigned_identity" "uai_tfvm" {
  name                = "uai-tfvm"
  resource_group_name = var.resource_group_name

  depends_on = [azurerm_user_assigned_identity.uai_tfvm]
}