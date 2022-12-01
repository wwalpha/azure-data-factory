locals {
  onpremise_connection_string = "Server=tcp:${module.computing.database_private_ip_address},1433;Initial Catalog=AdventureWorks2012;Persist Security Info=False;User ID=${var.sqlserver_dmin_username};Password=${var.sqlserver_dmin_password};MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;"
  suffix                      = random_id.this.hex
  tenant_id                   = data.azurerm_client_config.this.tenant_id
}

resource "random_id" "this" {
  byte_length = 4
}

data "azurerm_client_config" "this" {}
