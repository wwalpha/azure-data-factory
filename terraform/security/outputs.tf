output "key_vault_id" {
  value = azurerm_key_vault.this.id
}

output "key_vault_secret_mssql_conn" {
  value = azurerm_key_vault_secret.mssql_conn.name
}

output "key_vault_secret_mssql_psw" {
  value = azurerm_key_vault_secret.mssql_psw.name
}

output "key_vault_secret_sqlserver_conn" {
  value = azurerm_key_vault_secret.sqlserver_conn.name
}

output "key_vault_secret_sqlserver_psw" {
  value = azurerm_key_vault_secret.sqlserver_psw.name
}

output "key_vault_secret_sa_conn" {
  value = azurerm_key_vault_secret.sa.name
}
