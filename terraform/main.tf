terraform {
  backend "remote" {
    organization = "wwalpha"

    workspaces {
      name = "azure-data-factory"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  use_msi = true
}

resource "azurerm_resource_group" "this" {
  name     = "${var.resource_group_name}-${local.suffix}"
  location = var.resource_group_location
}

module "networking" {
  source = "./networking"

  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  suffix                  = local.suffix
  tenant_id               = local.tenant_id
  subscription_id         = local.subscription_id
  is_create_vpn_gateway   = var.is_create_vpn_gateway
}

module "database" {
  source = "./database"

  resource_group_name      = azurerm_resource_group.this.name
  resource_group_location  = azurerm_resource_group.this.location
  mssql_admin_username     = var.mssql_admin_username
  mssql_admin_password     = var.mssql_admin_password
  onpremise_vnet_id        = module.networking.onpremise_vnet_id
  onpremise_vnet_subnet_id = module.networking.onpremise_vnet_subnet_id
  suffix                   = local.suffix
  my_client_ip             = var.my_client_ip
}

module "storage" {
  source = "./storage"

  resource_group_name      = azurerm_resource_group.this.name
  resource_group_location  = azurerm_resource_group.this.location
  onpremise_vnet_id        = module.networking.onpremise_vnet_id
  onpremise_vnet_subnet_id = module.networking.onpremise_vnet_subnet_id
  suffix                   = local.suffix
}

module "datafactory" {
  depends_on = [
    module.storage.storage_account_name,
    module.database.mssql_connection_string
  ]

  source                           = "./datafactory"
  tenant_id                        = local.tenant_id
  resource_group_name              = azurerm_resource_group.this.name
  resource_group_location          = azurerm_resource_group.this.location
  onpremise_vnet_id                = module.networking.onpremise_vnet_id
  onpremise_vnet_subnet_id         = module.networking.onpremise_vnet_subnet_id
  storage_account_name             = module.storage.storage_account_name
  mssql_connection_string          = module.database.mssql_connection_string
  onpremise_connection_string      = local.onpremise_connection_string
  is_self_hosted_ir_setup_finished = var.is_self_hosted_ir_setup_finished
  suffix                           = local.suffix
}

module "computing" {
  source = "./computing"

  resource_group_name           = azurerm_resource_group.this.name
  resource_group_location       = azurerm_resource_group.this.location
  onpremise_vnet_subnet_id      = module.networking.onpremise_vnet_subnet_id
  forwarding_vnet_subnet_id     = module.networking.forwarding_vnet_subnet_id
  azurevm_admin_username        = var.azurevm_admin_username
  azurevm_admin_password        = var.azurevm_admin_password
  azure_vm_image_resource_group = var.azure_vm_image_resource_group
  azure_vm_image_database       = var.azure_vm_image_database
  azure_vm_image_self_hosted_ir = var.azure_vm_image_self_hosted_ir
  suffix                        = local.suffix
}
