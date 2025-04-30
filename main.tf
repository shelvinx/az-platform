# Resource Group
module "naming" {
    source = "Azure/naming/azurerm"
    version = "0.4.2"

    suffix = [var.workload]
}

module "rg" {
    source = "Azure/avm-res-resources-resourcegroup/azurerm"
    version = "0.2.1"

    name = var.resource_group_name
    location = var.location

    tags = var.tags
}

# User Assigned Managed ID for Virtual Machines
resource "azurerm_user_assigned_identity" "uai_tfvm" {
    name = "uai-tfvm"
    location = var.location
    resource_group_name = var.resource_group_name

    tags = var.tags
}