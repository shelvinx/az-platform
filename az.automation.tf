# Azure Automation Account
module "automation_account" {
  source  = "Azure/avm-res-automation-automationaccount/azurerm"
  version = "~> 0.1.0"

  name                = module.naming.automation_account.name
  location            = var.location
  resource_group_name = module.rg.name
  sku                 = "Free"

  # Enable system-assigned managed identity
  managed_identities = {
    system_assigned = true
  }

  tags = merge(var.tags, {
    component = "automation"
  })
}