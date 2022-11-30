resource "azurerm_data_factory" "this" {
  name                   = "datafactory-${var.suffix}"
  location               = var.resource_group_location
  resource_group_name    = var.resource_group_name
  public_network_enabled = false

  # github_configuration {
  #   git_url         = "https://github.com/"
  #   account_name    = "wwalpha"
  #   branch_name     = "master"
  #   repository_name = "azure-data-factory"
  #   root_folder     = "/database-sync/materials"
  # }

  lifecycle {
    ignore_changes = [
      github_configuration
    ]
  }
}

resource "azurerm_data_factory_integration_runtime_self_hosted" "this" {
  name            = "self-hosted-ir"
  data_factory_id = azurerm_data_factory.this.id
}
