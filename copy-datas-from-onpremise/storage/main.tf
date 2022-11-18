data "azurerm_client_config" "this" {}

resource "azurerm_storage_account" "this" {
  name                     = "storage${var.suffix}"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Allow"
    virtual_network_subnet_ids = [var.vnet_subnets[0]]

    private_link_access {
      endpoint_tenant_id   = data.azurerm_client_config.this.tenant_id
      endpoint_resource_id = "dataFactory"
    }
  }
}

# resource "azurerm_storage_container" "this" {
#   name                  = "content"
#   storage_account_name  = azurerm_storage_account.this.name
#   container_access_type = "private"
# }
