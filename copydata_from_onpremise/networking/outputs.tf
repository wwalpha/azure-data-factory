output "vnet_subnets" {
  value = [azurerm_subnet.subnet1.id, azurerm_subnet.subnet2.id]
}
