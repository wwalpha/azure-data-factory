resource "azurerm_key_vault_secret" "mssql_conn" {
  name         = "mssql-conn-string-${var.suffix}"
  value        = var.mssql_conn_string
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "mssql_psw" {
  name         = "mssql-passwd-${var.suffix}"
  value        = var.mssql_admin_password
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sqlserver_conn" {
  name         = "sqlserver-conn-string-${var.suffix}"
  value        = var.sqlserver_conn_string
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sqlserver_psw" {
  name         = "sqlserver-passwd-${var.suffix}"
  value        = var.sqlserver_admin_password
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sa" {
  name         = "sa-conn-string-${var.suffix}"
  value        = var.storage_account_conn_string
  key_vault_id = azurerm_key_vault.this.id
}
