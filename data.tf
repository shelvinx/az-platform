data "azurerm_client_config" "this" {}

data "azuread_user" "this" {
  user_principal_name = var.UPN_ADMIN
}