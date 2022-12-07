resource "azurerm_data_factory_managed_private_endpoint" "blob" {
  name               = "AzureBlobStorage"
  data_factory_id    = azurerm_data_factory.this.id
  target_resource_id = var.storage_account_id
  subresource_name   = "blob"
}

resource "azurerm_data_factory_managed_private_endpoint" "mssql" {
  name               = "AzureSqlDatabase"
  data_factory_id    = azurerm_data_factory.this.id
  target_resource_id = var.mssql_server_id
  subresource_name   = "sqlServer"
}
