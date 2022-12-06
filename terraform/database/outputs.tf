output "mssql_server_id" {
  value = azurerm_mssql_server.this.id
}

output "mssql_server_name" {
  value = azurerm_mssql_server.this.name
}

output "mssql_database_name" {
  value = azurerm_mssql_database.this.name
}

output "mssql_database_fqdn" {
  value = azurerm_mssql_server.this.fully_qualified_domain_name
}
