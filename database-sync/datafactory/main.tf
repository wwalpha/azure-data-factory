resource "azurerm_data_factory" "this" {
  name                   = "datafactory-${var.suffix}"
  location               = var.resource_group_location
  resource_group_name    = var.resource_group_name
  public_network_enabled = false
}

resource "azurerm_data_factory_integration_runtime_self_hosted" "this" {
  name            = "self-hosted-ir"
  data_factory_id = azurerm_data_factory.this.id
}