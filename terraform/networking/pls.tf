resource "azurerm_private_link_service" "datafactory" {
  name                                        = "datafactory-privatelink"
  resource_group_name                         = var.resource_group_name
  location                                    = var.resource_group_location
  load_balancer_frontend_ip_configuration_ids = [azurerm_lb.forwarding.frontend_ip_configuration[0].id]
  enable_proxy_protocol                       = false

  nat_ip_configuration {
    name      = "primary"
    primary   = true
    subnet_id = azurerm_subnet.forwarding_subnet.id
  }
}
