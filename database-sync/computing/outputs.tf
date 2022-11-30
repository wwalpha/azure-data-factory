output "database_private_ip_address" {
  value = azurerm_network_interface.database.private_ip_address
}

output "self_hosted_ir_private_ip_address" {
  value = azurerm_network_interface.self_hosted_ir.private_ip_address
}
