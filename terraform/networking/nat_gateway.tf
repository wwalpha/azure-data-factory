resource "azurerm_public_ip" "nat_gw" {
  name                = "nat-gateway-publicip-${var.suffix}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "this" {
  name                    = "nat-gateway-${var.suffix}"
  location                = var.resource_group_location
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = azurerm_public_ip.nat_gw.id
}

resource "azurerm_subnet_nat_gateway_association" "forwarding" {
  subnet_id      = azurerm_subnet.forwarding_subnet.id
  nat_gateway_id = azurerm_nat_gateway.this.id
}
