resource "azurerm_data_factory_integration_runtime_azure" "this" {
  name                    = "AzureIntegrationRuntime"
  data_factory_id         = azurerm_data_factory.this.id
  location                = var.resource_group_location
  virtual_network_enabled = true
  cleanup_enabled         = true
  time_to_live_min        = 60
}

resource "azurerm_data_factory_integration_runtime_self_hosted" "this" {
  name            = "SelfHostedIntegrationRuntime"
  data_factory_id = azurerm_data_factory.this.id
}
