# Azure Verified Module - VNET Spoke
# AVM Module for VNET
module "vnet-spoke" {
    source = "Azure/avm-res-network-virtualnetwork/azurerm"
    version = "0.8.1"

    name = "vnet-spoke"
    location = var.location
    resource_group_name = var.resource_group_name

    address_space = ["10.1.0.0/16"]

    subnets = {
      default = {
        name = "default"
        address_prefix = ["10.1.1.0/24"]
      }
    }
}

# AVM Module for NSG
module "nsg-default" {
    source = "Azure/avm-res-network-networksecuritygroup/azurerm"
    version = "0.4.0"

    name = "nsg-default"
    location = var.location
    resource_group_name = var.resource_group_name

    security_rules = {
        AllowSSH = {
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "22"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
        AllowRDP = {
            priority                   = 110
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "3389"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
        AllowHTTPS = {
            priority                   = 120
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "443"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
        AllowICMP = {
            priority                   = 130
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Icmp"
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
        AllowSQL = {
            priority                   = 140
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "1433"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
    }

    tags = var.tags
}