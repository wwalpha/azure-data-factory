data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "this" {
  name              = "blob_storage"
  data_factory_id   = azurerm_data_factory.this.id
  connection_string = data.azurerm_storage_account.this.primary_connection_string
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "this" {
  name              = "mssql_database"
  data_factory_id   = azurerm_data_factory.this.id
  connection_string = var.mssql_connection_string
}
