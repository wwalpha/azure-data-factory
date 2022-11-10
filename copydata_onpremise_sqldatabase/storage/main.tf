resource "random_id" "this" {
  byte_length = 4
}

resource "azurerm_storage_account" "this" {
  name                     = "sa${random_id.this.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "this" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
