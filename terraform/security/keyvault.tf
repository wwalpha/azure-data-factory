resource "azurerm_key_vault_secret" "mssql_conn" {
  name         = "mssql-connection-string"
  value        = var.mssql_connection_string
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "mssql_psw" {
  name         = "mssql-passwd"
  value        = var.mssql_admin_password
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sqlserver_conn" {
  name         = "sqlserver-connection-string"
  value        = var.sqlserver_connection_string
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sqlserver_psw" {
  name         = "sqlserver-passwd"
  value        = var.sqlserver_admin_password
  key_vault_id = azurerm_key_vault.this.id
}
