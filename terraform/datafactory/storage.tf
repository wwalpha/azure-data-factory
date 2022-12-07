resource "azurerm_storage_account_network_rules" "this" {
  storage_account_id         = var.storage_account_id
  default_action             = "Deny"
  bypass                     = ["AzureServices"]
  virtual_network_subnet_ids = [var.onpremise_vnet_subnet_id]

  private_link_access {
    endpoint_tenant_id   = var.tenant_id
    endpoint_resource_id = azurerm_data_factory.this.id
  }
}

