data "azurerm_image" "sqlserver2012" {
  name                = "win2012-sqlserver2012-adventures"
  resource_group_name = "DEV_RG"
}

resource "azurerm_virtual_machine" "win2012" {
  depends_on                       = [azurerm_network_interface_security_group_association.win2012]
  name                             = "win2012-vm"
  location                         = var.resource_group_location
  resource_group_name              = var.resource_group_name
  vm_size                          = "Standard_B2ms"
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  network_interface_ids            = [azurerm_network_interface.win2012.id]

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
    name              = "win2012_sql2012"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
    os_type           = "Windows"
  }

  storage_image_reference {
    id = data.azurerm_image.sqlserver2012.id
  }
}
