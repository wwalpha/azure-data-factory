resource "azurerm_virtual_network_peering" "onpremise_forwarding" {
  count                     = var.is_create_vpn_gateway ? 1 : 0
  depends_on                = [azurerm_virtual_network_gateway.this]
  name                      = "onpremise_to_forwarding"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.onpremise.name
  remote_virtual_network_id = azurerm_virtual_network.forwarding.id
  allow_forwarded_traffic   = true
  use_remote_gateways       = true
}

resource "azurerm_virtual_network_peering" "forwarding_onpremise" {
  count                     = var.is_create_vpn_gateway ? 1 : 0
  depends_on                = [azurerm_virtual_network_gateway.this]
  name                      = "forwarding_to_onpremise"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.forwarding.name
  remote_virtual_network_id = azurerm_virtual_network.onpremise.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = true
}
