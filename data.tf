data "azurerm_client_config" "this" {}

data "azuread_user" "user_admin" {
  user_principal_name = var.UPN_ADMIN
}

data "azurerm_user_assigned_identity" "uai_tfvm" {
  name                = "uai-tfvm"
  resource_group_name = var.resource_group_name

  depends_on = [azurerm_user_assigned_identity.uai_tfvm]
}
