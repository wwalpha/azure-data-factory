data "azurerm_client_config" "this" {}

data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account_network_rules" "this" {
  storage_account_id         = data.azurerm_storage_account.this.id
  default_action             = "Deny"
  virtual_network_subnet_ids = [var.vnet_subnets[0]]

  private_link_access {
    endpoint_tenant_id   = data.azurerm_client_config.this.tenant_id
    endpoint_resource_id = azurerm_data_factory.this.id
  }
}

