resource "azurerm_private_dns_zone" "database" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "database" {
  name                  = "database"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.database.name
  virtual_network_id    = azurerm_virtual_network.this.id
  registration_enabled  = false
}

resource "azurerm_private_dns_zone" "portal" {
  name                = "privatelink.adf.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "portal" {
  name                  = "portal"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.portal.name
  virtual_network_id    = azurerm_virtual_network.this.id
  registration_enabled  = false
}

resource "azurerm_private_dns_zone" "datafactory" {
  name                = "privatelink.datafactory.azure.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "datafactory" {
  name                  = "datafactory"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.datafactory.name
  virtual_network_id    = azurerm_virtual_network.this.id
  registration_enabled  = false
}



