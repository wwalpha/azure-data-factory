resource "azurerm_virtual_machine" "forward_backend" {
  name                  = "forward-backend-${var.suffix}"
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.forward_backend.id]
  vm_size               = "Standard_B2ms"

  storage_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  storage_os_disk {
    name              = "forwarding${var.suffix}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }

  os_profile {
    computer_name  = "ForwardBackend"
    admin_username = var.azurevm_admin_username
    admin_password = var.azurevm_admin_password
    custom_data    = base64encode(local.user_data)
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "forward_backend" {
  network_interface_id    = azurerm_network_interface.forward_backend.id
  ip_configuration_name   = azurerm_network_interface.forward_backend.ip_configuration[0].name
  backend_address_pool_id = var.lb_backend_address_pool_id
}
