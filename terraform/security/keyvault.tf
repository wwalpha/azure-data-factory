resource "azurerm_key_vault_secret" "mssql_conn" {
  depends_on   = [azurerm_key_vault_access_policy.this]
  name         = "mssql-conn-string-${var.suffix}"
  value        = var.mssql_conn_string
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "mssql_psw" {
  depends_on   = [azurerm_key_vault_access_policy.this]
  name         = "mssql-passwd-${var.suffix}"
  value        = var.mssql_admin_password
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sqlserver_conn" {
  depends_on   = [azurerm_key_vault_access_policy.this]
  name         = "sqlserver-conn-string-${var.suffix}"
  value        = var.sqlserver_conn_string
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sqlserver_psw" {
  depends_on   = [azurerm_key_vault_access_policy.this]
  name         = "sqlserver-passwd-${var.suffix}"
  value        = var.sqlserver_admin_password
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "sa" {
  depends_on   = [azurerm_key_vault_access_policy.this]
  name         = "sa-conn-string-${var.suffix}"
  value        = var.storage_account_conn_string
  key_vault_id = azurerm_key_vault.this.id
}
