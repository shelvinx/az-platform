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
}