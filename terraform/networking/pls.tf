resource "azurerm_private_link_service" "datafactory" {
  name                                        = "datafactory-privatelink"
  resource_group_name                         = var.resource_group_name
  location                                    = var.resource_group_location
  auto_approval_subscription_ids              = [var.subscription_id]
  visibility_subscription_ids                 = [var.subscription_id]
  load_balancer_frontend_ip_configuration_ids = [azurerm_lb.forwarding.frontend_ip_configuration[0].id]
  enable_proxy_protocol                       = false

  nat_ip_configuration {
    name      = "primary"
    primary   = true
    subnet_id = azurerm_subnet.forwarding_subnet.id
  }
}

data "azurerm_private_link_service_endpoint_connections" "datafactory" {
  service_id          = azurerm_private_link_service.datafactory.id
  resource_group_name = var.resource_group_name
}
