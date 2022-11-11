output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "data_factory_name" {
  value = module.datafactory.data_factory_name
}

output "sql_database_name" {
  value = module.database.mssql_server_name
}

output "self_hosted_ir_primary_authorization_key" {
  sensitive = true
  value     = module.datafactory.self_hosted_ir_primary_authorization_key
}

output "self_hosted_ir_secondary_authorization_key" {
  sensitive = true
  value     = module.datafactory.self_hosted_ir_secondary_authorization_key
}

output "azure_vm_private_ip_address" {
  value = module.computing.azure_vm_private_ip_address
}
