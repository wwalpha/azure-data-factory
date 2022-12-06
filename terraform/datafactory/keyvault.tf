resource "azurerm_key_vault_access_policy" "adf" {
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_data_factory.this.identity[0].principal_id

  key_permissions = [
    "Get"
  ]

  secret_permissions = [
    "List",
    "Get"
  ]
}
