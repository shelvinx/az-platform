data "azurerm_client_config" "this" {}

data "azuread_user" "example" {
  user_principal_name = var.upn_admin
}