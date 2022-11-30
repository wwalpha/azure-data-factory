# resource "azurerm_data_factory_custom_dataset" "csv" {
#   name            = "PersonCSV"
#   type            = "DelimitedText"
#   data_factory_id = azurerm_data_factory.this.id

#   linked_service {
#     name = azurerm_data_factory_linked_service_azure_blob_storage.this.name
#   }

#   type_properties_json = jsonencode({
#     firstRowAsHeader = true
#     location = {
#       type      = "DatasetLocation"
#       container = "content"
#     }
#   })
# }


resource "azurerm_data_factory_custom_dataset" "person" {
  name            = "PersonTableSrc"
  type            = "SqlServerTable"
  data_factory_id = azurerm_data_factory.this.id

  linked_service {
    name = azurerm_data_factory_linked_service_sql_server.this[0].name
  }

  type_properties_json = jsonencode({
    schema = "Person"
    table  = "Person"
  })

  schema_json = jsonencode(
    [
      {
        name      = "BusinessEntityID"
        precision = 10
        type      = "int"
      },
      {
        name = "PersonType"
        type = "nchar"
      },
      {
        name = "NameStyle"
        type = "bit"
      },
      {
        name = "Title"
        type = "nvarchar"
      },
      {
        name = "FirstName"
        type = "nvarchar"
      },
      {
        name = "MiddleName"
        type = "nvarchar"
      },
      {
        name = "LastName"
        type = "nvarchar"
      },

      {
        name = "Suffix"
        type = "nvarchar"
      },
      {
        name      = "EmailPromotion"
        precision = 10
        type      = "int"
      },
      {
        name = "AdditionalContactInfo"
        type = "xml"
      },
      {
        name = "Demographics"
        type = "xml"
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


resource "azurerm_data_factory_custom_dataset" "sqldatabase" {
  name            = "PersonTableDest"
  type            = "AzureSqlTable"
  data_factory_id = azurerm_data_factory.this.id

  linked_service {
    name = azurerm_data_factory_linked_service_azure_sql_database.this.name
  }

  type_properties_json = jsonencode({
    schema = "Person"
    table  = "NewPerson"
  })

  schema_json = jsonencode(
    [
      {
        "name" : "BusinessEntityID",
        "type" : "int",
        "precision" : 10
      },
      {
        "name" : "PersonType",
        "type" : "nchar"
      },
      {
        "name" : "Title",
        "type" : "nvarchar"
      },
      {
        "name" : "FirstName",
        "type" : "nvarchar"
      },
      {
        "name" : "MiddleName",
        "type" : "nvarchar"
      },
      {
        "name" : "LastName",
        "type" : "nvarchar"
      },
      {
        "name" : "Suffix",
        "type" : "nvarchar"
      },
      {
        "name" : "EmailPromotion",
        "type" : "int",
        "precision" : 10
      }
    ]
  )

  count = var.is_self_hosted_ir_setup_finished ? 1 : 0
}
