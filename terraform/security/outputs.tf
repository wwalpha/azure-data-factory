output "key_vault_id" {
  value = azurerm_key_vault.this.id
}

output "mssql_conn_secret_name" {
  value = azurerm_key_vault_secret.mssql_conn.name
}

output "mssql_conn_secret_psw" {
  value = azurerm_key_vault_secret.mssql_psw.name
}

output "sqlserver_conn_secret_name" {
  value = azurerm_key_vault_secret.sqlserver_conn.name
}

output "sqlserver_conn_secret_psw" {
  value = azurerm_key_vault_secret.sqlserver_psw.name
}
