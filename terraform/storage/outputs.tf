output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_account_primary_conn_string" {
  value = azurerm_storage_account.this.primary_connection_string
}
