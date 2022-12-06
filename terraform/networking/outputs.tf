output "onpremise_vnet_id" {
  value = azurerm_virtual_network.onpremise.id
}

output "onpremise_vnet_subnet_id" {
  value = azurerm_subnet.onpremise_subnet.id
}

output "forwarding_vnet_id" {
  value = azurerm_virtual_network.forwarding.id
}

output "forwarding_vnet_subnet_id" {
  value = azurerm_subnet.forwarding_subnet.id
}
