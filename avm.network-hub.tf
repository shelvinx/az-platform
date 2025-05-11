# AVM for HUB Network
module "vnet_hub" {
    source = "Azure/avm-res-network-virtualnetwork/azurerm"
    version = "0.8.1"

    name = "vnet-hub"
    location = var.location
    resource_group_name = var.resource_group_name

    address_space = ["10.0.0.0/16"]

    subnets = {
     AzureFirewallSubnet = {
        name = "AzureFirewallSubnet"
        address_prefix = "10.0.0.0/27"
     }
     GatewaySubnet = {
        name = "GatewaySubnet"
        address_prefix = "10.0.1.0/27"
     }
     AzureBastionSubnet = {
        name = "AzureBastionSubnet"
        address_prefix = "10.0.2.0/27"
     }
     Default = {
        name = "default"
        address_prefix = "10.0.3.0/24"
     }
    }

    tags = var.tags
}