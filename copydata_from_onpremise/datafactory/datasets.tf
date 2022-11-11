resource "azurerm_data_factory_dataset_delimited_text" "this" {
  name                = "PersonAddressCsv"
  data_factory_id     = azurerm_data_factory.this.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.this.name

  azure_blob_storage_location {
    container = "content"
  }

  column_delimiter    = ","
  row_delimiter       = "\r\n"
  escape_character    = "\\"
  first_row_as_header = true
  quote_character     = "\""
}

# resource "azurerm_data_factory_dataset_sql_server_table" "address" {
#   name                = "PersonAddressTable"
#   data_factory_id     = azurerm_data_factory.this.id
#   linked_service_name = azurerm_data_factory_linked_service_sql_server.this[0].name
#   table_name          = "[Person].[Address]"



#   schema_column {
#     name = "AddressID"
#     type = "Int32"
#   }
#   schema_column {
#     name = "AddressLine1"
#     type = "String"
#   }
#   schema_column {
#     name = "AddressLine2"
#     type = "String"
#   }
#   schema_column {
#     name = "City"
#     type = "String"
#   }
#   schema_column {
#     name = "StateProvinceID"
#     type = "Int32"
#   }
#   schema_column {
#     name = "PostalCode"
#     type = "String"
#   }
#   schema_column {
#     name = "SpatialLocation"
#   }
#   schema_column {
#     name = "rowguid"
#     type = "Guid"
#   }
#   schema_column {
#     name = "ModifiedDate"
#     type = "DateTime"
#   }

#   count = var.is_self_hosted_ir_setup_finished ? 1 : 0
# }

resource "azurerm_data_factory_custom_dataset" "address" {
  name            = "PersonAddressTable"
  type            = "SqlServerTable"
  data_factory_id = azurerm_data_factory.this.id

  linked_service {
    name = azurerm_data_factory_linked_service_sql_server.this[0].name
  }

  type_properties_json = jsonencode({
    schema = "Person"
    table  = "Address"
  })

  schema_json = jsonencode(
    [
      {
        name      = "AddressID"
        precision = 10
        type      = "int"
      },
      {
        name = "AddressLine1"
        type = "nvarchar"
      },
      {
        name = "AddressLine2"
        type = "nvarchar"
      },
      {
        name = "City"
        type = "nvarchar"
      },
      {
        name      = "StateProvinceID"
        precision = 10
        type      = "int"
      },
      {
        name = "PostalCode"
        type = "nvarchar"
      },
      {
        name = "SpatialLocation"
        type = "geography"
      },
      {
        name = "rowguid"
        type = "uniqueidentifier"
      },
      {
        name      = "ModifiedDate"
        precision = 23
        scale     = 3
        type      = "datetime"
      },
    ]
  )

  count = var.is_self_hosted_ir_setup_finished ? 1 : 0
}
