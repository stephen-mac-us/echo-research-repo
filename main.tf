provider "azurerm" {
  features = {}
}

resource "azurerm_storage_account" "insecure" {
  name                     = "vulnerablestorageacct"
  resource_group_name      = "myResourceGroup"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  enable_https_traffic_only = false  # BAD: allows insecure HTTP traffic

  tags = {
    environment = "Test"
  }
}

resource "azurerm_network_security_group" "allow_all" {
  name                = "nsg-allow-all"
  location            = "East US"
  resource_group_name = "myResourceGroup"

  security_rule {
    name                       = "AllowAllInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
