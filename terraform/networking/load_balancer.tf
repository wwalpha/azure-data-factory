resource "azurerm_lb" "forwarding" {
  name                = "forwarding-lb-${var.suffix}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  sku_tier            = "Regional"

  frontend_ip_configuration {
    name                          = "InternalIPAddress"
    private_ip_address            = "10.1.1.10"
    private_ip_address_allocation = "Static"
    private_ip_address_version    = "IPv4"
    subnet_id                     = azurerm_subnet.forwarding_subnet.id
  }
}

resource "azurerm_lb_probe" "forwarding" {
  loadbalancer_id     = azurerm_lb.forwarding.id
  name                = "forwarding-probe"
  protocol            = "Tcp"
  port                = 22
  interval_in_seconds = 15
}

resource "azurerm_lb_backend_address_pool" "forwarding" {
  loadbalancer_id = azurerm_lb.forwarding.id
  name            = "ForwardingBackendPool"
}

resource "azurerm_lb_rule" "forwarding" {
  loadbalancer_id                = azurerm_lb.forwarding.id
  name                           = "SQLServerRule"
  protocol                       = "Tcp"
  frontend_port                  = 1433
  backend_port                   = 1433
  frontend_ip_configuration_name = azurerm_lb.forwarding.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.forwarding.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.forwarding.id]
  enable_tcp_reset               = false
  idle_timeout_in_minutes        = 15
}
