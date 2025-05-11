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
        network_security_group = {
            id = "${module.nsg_default.resource_id}"
        }
     }
    }

    tags = var.tags
}

module "nsg_default" {
    source = "Azure/avm-res-network-networksecuritygroup/azurerm"
    version = "0.4.0"

    name = "nsg-default"
    location = var.location
    resource_group_name = var.resource_group_name

    security_rules = {
        AllowSSH = {
            name = "AllowSSH"
            priority = 100
            direction = "Inbound"
            access = "Allow"
            protocol = "Tcp"
            source_port_range = "*"
            destination_port_range = "22"
            source_address_prefix = "*"
            destination_address_prefix = "*"
        }
        AllowHTTP = {
            name = "AllowHTTP"
            priority = 101
            direction = "Inbound"
            access = "Allow"
            protocol = "Tcp"
            source_port_range = "*"
            destination_port_range = "80"
            source_address_prefix = "*"
            destination_address_prefix = "*"
        }
        AllowHTTPS = {
            name = "AllowHTTPS"
            priority = 102
            direction = "Inbound"
            access = "Allow"
            protocol = "Tcp"
            source_port_range = "*"
            destination_port_range = "443"
            source_address_prefix = "*"
            destination_address_prefix = "*"
        }
    }

    tags = var.tags
}
