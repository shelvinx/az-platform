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

# Outputs
output "automation_account_name" {
  description = "The name of the Automation Account"
  value       = module.automation_account.name
}

output "automation_account_id" {
  description = "The ID of the Automation Account"
  value       = module.automation_account.id
}

output "system_assigned_identity_principal_id" {
  description = "The principal ID of the system-assigned managed identity"
  value       = module.automation_account.system_assigned_identity_principal_id
}