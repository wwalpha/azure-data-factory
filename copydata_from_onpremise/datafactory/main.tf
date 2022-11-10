resource "random_id" "this" {
  byte_length = 4
}

resource "azurerm_data_factory" "this" {
  name                = "datafactory-${random_id.this.hex}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_pipeline" "copy_table_to_storage" {
  name            = "copy_table_to_storage"
  data_factory_id = azurerm_data_factory.this.id
}

resource "azurerm_data_factory_pipeline" "copy_table_to_database" {
  name            = "copy_table_to_database"
  data_factory_id = azurerm_data_factory.this.id
}

resource "azurerm_data_factory_integration_runtime_self_hosted" "this" {
  name            = "self-hosted-ir"
  data_factory_id = azurerm_data_factory.this.id
}
