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

output "lb_backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.forwarding.id
}

output "lb_private_ip_address" {
  value = azurerm_lb.forwarding.frontend_ip_configuration[0].private_ip_address
}

output "onpremise_dns_zone" {
  value = azurerm_private_dns_zone.onpremise.name
}

output "azurerm_nat_gateway_association" {
  value = azurerm_subnet_nat_gateway_association.forwarding
}

output "pls_id_for_datafactory" {
  value = azurerm_private_link_service.datafactory.id
}
