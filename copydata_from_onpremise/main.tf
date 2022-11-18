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

locals {
  onpremise_connection_string = "Server=tcp:${module.computing.database_private_ip_address},1433;Initial Catalog=AdventureWorks2012;Persist Security Info=False;User ID=${var.onpremise_admin_username};Password=${var.onpremise_admin_password};MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;"
  suffix                      = random_id.this.hex
}

resource "random_id" "this" {
  byte_length = 4
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
  suffix                  = local.suffix
}

module "storage" {
  source = "./storage"

  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  suffix                  = local.suffix
}

module "networking" {
  source = "./networking"

  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  mssql_server_id         = module.database.mssql_server_id
  suffix                  = local.suffix
}

module "computing" {
  source = "./computing"

  resource_group_name           = azurerm_resource_group.this.name
  resource_group_location       = azurerm_resource_group.this.location
  vnet_subnets                  = module.networking.vnet_subnets
  azurevm_admin_username        = var.azurevm_admin_username
  azurevm_admin_password        = var.azurevm_admin_password
  azure_vm_image_resource_group = var.azure_vm_image_resource_group
  azure_vm_image_database       = var.azure_vm_image_database
  azure_vm_image_self_hosted_ir = var.azure_vm_image_self_hosted_ir
  suffix                        = local.suffix
}

module "datafactory" {
  depends_on = [
    module.storage.storage_account_name,
    module.database.mssql_connection_string
  ]

  source                           = "./datafactory"
  resource_group_name              = azurerm_resource_group.this.name
  resource_group_location          = azurerm_resource_group.this.location
  storage_account_name             = module.storage.storage_account_name
  mssql_connection_string          = module.database.mssql_connection_string
  onpremise_connection_string      = local.onpremise_connection_string
  is_self_hosted_ir_setup_finished = var.is_self_hosted_ir_setup_finished
  suffix                           = local.suffix
}

# terraform import azurerm_data_factory_dataset_sql_server_table.address /subscriptions/cda6bd1cc03b40b5a2119b0bd4583a14/resourceGroups/DF_CD_RG/providers/Microsoft.DataFactory/factories/datafactory475be369/datasets/PersonAddressTable2
# terraform import azurerm_data_factory_custom_dataset.csv /subscriptions/cda6bd1c-c03b-40b5-a211-9b0bd4583a14/resourceGroups/DF_CD_RG/providers/Microsoft.DataFactory/factories/datafactory-475be369/datasets/PersonCSV

# /subscriptions/00000000000000000000000000000000/resourceGroups/example/providers/Microsoft.DataFactory/factories/example/datasets/example
# /subscriptions/cda6bd1cc03b40b5a2119b0bd4583a14/resourceGroups/DF_CD_RG/providers/Microsoft.DataFactory/factories/datafactory475be369/datasets/PersonCSV2


# resource "azurerm_data_factory_dataset_sql_server_table" "address" {
#   name                = "PersonAddressTable2"
#   data_factory_id     = "/subscriptions/cda6bd1cc03b40b5a2119b0bd4583a14/resourceGroups/DF_CD_RG/providers/Microsoft.DataFactory/factories/datafactory475be369"
#   linked_service_name = "adventureWorks2012"
#   table_name          = "Person.Address"
# }


# resource "azurerm_data_factory_custom_dataset" "csv" {
#   name            = "PersonCSV"
#   type            = "DelimitedText"
#   data_factory_id = "/subscriptions/cda6bd1c-c03b-40b5-a211-9b0bd4583a14/resourceGroups/DF_CD_RG/providers/Microsoft.DataFactory/factories/datafactory-475be369"

#   linked_service {
#     name = "blob_storage"
#   }

#   type_properties_json = jsonencode({
#     columnDelimiter  = ","
#     escapeChar       = "\\"
#     firstRowAsHeader = true
#     nullValue        = ""
#     quoteChar        = "\""
#     location = {
#       type      = "DatasetLocation"
#       container = "content"
#     }
#   })
# }
