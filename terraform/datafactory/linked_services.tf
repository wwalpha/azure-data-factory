resource "azurerm_data_factory_linked_service_key_vault" "this" {
  name            = "AzureKeyVault"
  data_factory_id = azurerm_data_factory.this.id
  key_vault_id    = var.key_vault_id
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "this" {
  depends_on               = [azurerm_data_factory_integration_runtime_azure.this]
  name                     = "AzureBlobStorage"
  data_factory_id          = azurerm_data_factory.this.id
  connection_string        = data.azurerm_storage_account.this.primary_connection_string
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.this.name

  # key_vault_connection_string {
  #   linked_service_name = azurerm_data_factory_linked_service_key_vault.this.name
  #   secret_name         = var.key_vault_secret_sa_conn
  # }
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "this" {
  depends_on               = [azurerm_data_factory_integration_runtime_azure.this]
  name                     = "AzureSqlDatabase"
  data_factory_id          = azurerm_data_factory.this.id
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.this.name

  key_vault_connection_string {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.this.name
    secret_name         = var.key_vault_secret_mssql_conn
  }

  key_vault_password {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.this.name
    secret_name         = var.key_vault_secret_mssql_passwd
  }
}

resource "azurerm_data_factory_linked_service_sql_server" "this" {
  name                     = "adventureWorks2012"
  data_factory_id          = azurerm_data_factory.this.id
  integration_runtime_name = azurerm_data_factory_integration_runtime_self_hosted.this.name

  key_vault_connection_string {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.this.name
    secret_name         = var.key_vault_secret_sqlserver_conn
  }

  key_vault_password {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.this.name
    secret_name         = var.key_vault_secret_sqlserver_passwd
  }

  count = var.is_self_hosted_ir_setup_finished ? 1 : 0
}
