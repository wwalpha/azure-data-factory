resource "azurerm_network_security_group" "win2012" {
  name                = "win2012-nsg"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "win2012" {
  name                = "win2012-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "win2012" {
  network_interface_id      = azurerm_network_interface.win2012.id
  network_security_group_id = azurerm_network_security_group.win2012.id
}
