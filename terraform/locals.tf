locals {
  sqlserver_connection_string = "Server=tcp:${local.sqlserver_database_fqdn},1433;Initial Catalog=AdventureWorks2012;Persist Security Info=False;User ID=${var.sqlserver_admin_username};MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;"
  mssql_connection_string     = "Server=tcp:${module.database.mssql_database_fqdn},1433;Initial Catalog=${module.database.mssql_database_name};Persist Security Info=False;User ID=${var.mssql_admin_username};MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;"
  suffix                      = random_id.this.hex
  tenant_id                   = data.azurerm_client_config.this.tenant_id
  subscription_id             = data.azurerm_subscription.this.subscription_id
  sqlserver_database_fqdn     = "${module.computing.sqlserver_database_hostname}.${module.networking.onpremise_dns_zone}"
}

resource "random_id" "this" {
  byte_length = 4
}

data "azurerm_client_config" "this" {}

data "azurerm_subscription" "this" {}
