resource "azurerm_private_endpoint" "portal" {
  name                = "portal_endpoint"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.onpremise_vnet_subnet_id

  private_service_connection {
    name                           = "portal_endpoint"
    private_connection_resource_id = azurerm_data_factory.this.id
    is_manual_connection           = false
    subresource_names              = ["portal"]
  }

  private_dns_zone_group {
    name = "default"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.portal.id
    ]
  }
}

data "azurerm_private_endpoint_connection" "portal" {
  name                = azurerm_private_endpoint.portal.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_endpoint" "datafactory" {
  name                = "datafactory_endpoint"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.onpremise_vnet_subnet_id

  private_service_connection {
    name                           = "datafactory_endpoint"
    private_connection_resource_id = azurerm_data_factory.this.id
    is_manual_connection           = false
    subresource_names              = ["dataFactory"]
  }

  private_dns_zone_group {
    name = "default"
    private_dns_zone_ids = [
      azurerm_private_dns_zone.datafactory.id
    ]
  }
}

data "azurerm_private_endpoint_connection" "datafactory" {
  name                = azurerm_private_endpoint.datafactory.name
  resource_group_name = var.resource_group_name
}
