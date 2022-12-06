output "database_private_ip_address" {
  value = azurerm_network_interface.database.private_ip_address
}

output "database_hostname" {
  value = flatten(azurerm_virtual_machine.database.os_profile.*.computer_name)[0]
}

output "self_hosted_ir_private_ip_address" {
  value = azurerm_network_interface.self_hosted_ir.private_ip_address
}

output "forward_private_ip_address" {
  value = azurerm_network_interface.forward_backend.private_ip_address
}
