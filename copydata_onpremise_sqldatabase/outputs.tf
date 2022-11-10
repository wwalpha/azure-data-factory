output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "data_factory_name" {
  value = module.datafactory.data_factory_name
}

output "sql_database_name" {
  value = module.database.mssql_server_name
}
