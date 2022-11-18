data "azurerm_image" "database" {
  name                = var.azure_vm_image_database
  resource_group_name = var.azure_vm_image_resource_group
}

resource "azurerm_virtual_machine" "database" {
  depends_on                       = [azurerm_network_interface_security_group_association.database]
  name                             = "database-${var.suffix}"
  location                         = var.resource_group_location
  resource_group_name              = var.resource_group_name
  vm_size                          = "Standard_B2ms"
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  network_interface_ids            = [azurerm_network_interface.database.id]

  os_profile {
    computer_name  = "SQLServer2012"
    admin_username = var.azurevm_admin_username
    admin_password = var.azurevm_admin_password
  }

  os_profile_windows_config {
    provision_vm_agent        = false
    enable_automatic_upgrades = false
    timezone                  = "Tokyo Standard Time"
  }

  storage_os_disk {
    name              = "database${var.suffix}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
    os_type           = "Windows"
  }

  storage_image_reference {
    id = data.azurerm_image.database.id
  }
}
