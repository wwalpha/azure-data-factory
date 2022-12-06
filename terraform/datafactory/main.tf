resource "azurerm_data_factory" "this" {
  name                            = "datafactory-${var.suffix}"
  location                        = var.resource_group_location
  resource_group_name             = var.resource_group_name
  public_network_enabled          = false
  managed_virtual_network_enabled = true

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      github_configuration
    ]
  }
}
