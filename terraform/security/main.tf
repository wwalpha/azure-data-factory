data "external" "account_info" {
  program = ["bash", "-c", "curl -s 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/' --header 'Metadata: true' | jq -r .access_token | jq -R 'split(\".\") | .[1] | @base64d | fromjson | {oid: .oid, appid: .appid,tid: .tid}'"]
}

resource "azurerm_key_vault" "this" {
  name                       = "key-vault-${var.suffix}"
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  tenant_id                  = var.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  access_policy {
    tenant_id = tomap(data.external.account_info.result).tid
    object_id = tomap(data.external.account_info.result).oid

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set"
    ]
  }
}
