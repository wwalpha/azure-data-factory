output "azure_vm_private_ip_address" {
  value = azurerm_network_interface.win2012.private_ip_address
}
