resource "azurerm_storage_account" "this" {
  name                          = "storagea${var.suffix}"
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = true
}

# resource "azurerm_storage_container" "this" {
#   name                  = "content"
#   storage_account_name  = azurerm_storage_account.this.name
#   container_access_type = "private"
# }
