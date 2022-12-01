resource "azurerm_mssql_server" "this" {
  name                          = "mssqlserver-${var.suffix}"
  location                      = var.resource_group_location
  resource_group_name           = var.resource_group_name
  version                       = "12.0"
  administrator_login           = var.mssql_admin_username
  administrator_login_password  = var.mssql_admin_password
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
}

resource "azurerm_mssql_database" "this" {
  name                 = "mssqlserver"
  server_id            = azurerm_mssql_server.this.id
  sku_name             = "S0"
  storage_account_type = "Local"
  max_size_gb          = 10
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  license_type         = "LicenseIncluded"
  read_scale           = false
  zone_redundant       = false
}

resource "azurerm_mssql_firewall_rule" "allow_services" {
  name             = "AllowServices"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allow_my_client" {
  name             = "AllowMyClient"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = var.my_client_ip
  end_ip_address   = var.my_client_ip
}
