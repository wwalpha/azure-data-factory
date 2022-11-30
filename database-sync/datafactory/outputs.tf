output "data_factory_id" {
  value = azurerm_data_factory.this.id
}

output "data_factory_name" {
  value = azurerm_data_factory.this.name
}

output "self_hosted_ir_primary_authorization_key" {
  value = azurerm_data_factory_integration_runtime_self_hosted.this.primary_authorization_key
}

output "self_hosted_ir_secondary_authorization_key" {
  value = azurerm_data_factory_integration_runtime_self_hosted.this.secondary_authorization_key
}

