resource "azurerm_private_dns_zone" "private_link" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_dns" {
  name                  = "pl-vnet"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_link.name
  virtual_network_id    = azurerm_virtual_network.this.id
  registration_enabled  = false
}
