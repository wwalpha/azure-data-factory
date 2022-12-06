resource "azurerm_virtual_network" "forwarding" {
  name                = "forwarding-vnet"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "forwarding_gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.forwarding.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_subnet" "forwarding_subnet" {
  name                                          = "forwarding-subnet"
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.forwarding.name
  address_prefixes                              = ["10.1.1.0/24"]
  private_endpoint_network_policies_enabled     = false
  private_link_service_network_policies_enabled = false
}
