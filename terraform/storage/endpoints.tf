resource "azurerm_private_endpoint" "storage" {
  name                = "storage_endpoint"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.vnet_subnets[0]

  private_service_connection {
    name                           = "storage_endpoint"
    private_connection_resource_id = azurerm_storage_account.this.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name = "default"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.blob_storage.id
    ]
  }
}

data "azurerm_private_endpoint_connection" "storage" {
  name                = azurerm_private_endpoint.storage.name
  resource_group_name = var.resource_group_name
}
