resource "random_id" "this" {
  byte_length = 4
}

resource "azurerm_data_factory" "this" {
  name                = "datafactory-${random_id.this.hex}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

