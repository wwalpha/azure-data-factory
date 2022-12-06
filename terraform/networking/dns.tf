resource "azurerm_private_dns_zone" "onpremise" {
  name                = "onpremise.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "onpremise" {
  name                  = "onpremise-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.onpremise.name
  virtual_network_id    = azurerm_virtual_network.onpremise.id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "forwarding" {
  name                  = "forwarding-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.onpremise.name
  virtual_network_id    = azurerm_virtual_network.forwarding.id
  registration_enabled  = false
}
