resource "azurerm_private_endpoint" "mssql" {
  name                = "mssql_endpoint"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.onpremise_vnet_subnet_id

  private_service_connection {
    name                           = "mssql_endpoint"
    private_connection_resource_id = azurerm_mssql_server.this.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name = "default"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.database.id
    ]
  }
}

data "azurerm_private_endpoint_connection" "mssql" {
  name                = azurerm_private_endpoint.mssql.name
  resource_group_name = var.resource_group_name
}
