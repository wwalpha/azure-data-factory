terraform {
  backend "remote" {
    organization = "wwalpha"

    workspaces {
      name = "datafactory_copydata_onpremise_sqldatabase"
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
  }

  use_msi = true
}

resource "azurerm_resource_group" "this" {
  name     = "DF_CD_RG"
  location = "Japan East"
}

module "database" {
  source = "./database"

  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  mssql_admin_username    = var.mssql_admin_username
  mssql_admin_password    = var.mssql_admin_password
}

module "storage" {
  source = "./storage"

  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
}

module "networking" {
  source = "./networking"

  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  mssql_server_id         = module.database.mssql_server_id
}

module "computing" {
  source = "./computing"

  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  vnet_subnets            = module.networking.vnet_subnets
  azurevm_admin_username  = var.azurevm_admin_username
  azurevm_admin_password  = var.azurevm_admin_password
}

module "datafactory" {
  depends_on = [
    module.storage.storage_account_name,
    module.database.mssql_connection_string
  ]

  source                  = "./datafactory"
  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  storage_account_name    = module.storage.storage_account_name
  mssql_connection_string = module.database.mssql_connection_string
}
