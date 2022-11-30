# resource "azurerm_data_factory_pipeline" "database" {
#   depends_on = [
#     azurerm_data_factory_custom_dataset.person,
#     azurerm_data_factory_custom_dataset.sqldatabase
#   ]

#   name            = "copy_table_to_database"
#   data_factory_id = azurerm_data_factory.this.id
#   activities_json = jsonencode(
#     [
#       {
#         name = "database",
#         type = "Copy"
#         inputs = [
#           {
#             type          = "DatasetReference"
#             referenceName = azurerm_data_factory_custom_dataset.person[0].name
#           }
#         ]
#         outputs = [
#           {
#             type          = "DatasetReference"
#             referenceName = azurerm_data_factory_custom_dataset.sqldatabase[0].name
#           }
#         ]
#         policy = {
#           retry                  = 0
#           retryIntervalInSeconds = 30
#           secureInput            = false
#           secureOutput           = false
#           timeout                = "0.12:00:00"
#         }
#         typeProperties = {
#           source = {
#             type            = "SqlServerSource"
#             queryTimeout    = "02:00:00"
#             partitionOption = "None"
#           }
#           sink = {
#             type                  = "AzureSqlSink",
#             sqlWriterUseTableLock = false,
#             writeBehavior         = "insert"
#           },
#           enableStaging = false,
#           translator = {
#             type = "TabularTranslator",
#             mappings = [
#               {
#                 source = {
#                   name         = "BusinessEntityID",
#                   type         = "Int32",
#                   physicalType = "int"
#                 },
#                 sink = {
#                   name         = "BusinessEntityID",
#                   type         = "Int32",
#                   physicalType = "int"
#                 }
#               },
#               {
#                 source = {
#                   name         = "PersonType",
#                   type         = "String",
#                   physicalType = "nchar"
#                 },
#                 sink = {
#                   name         = "PersonType",
#                   type         = "String",
#                   physicalType = "nchar"
#                 }
#               },
#               {
#                 source = {
#                   name         = "FirstName",
#                   type         = "String",
#                   physicalType = "nvarchar"
#                 },
#                 sink = {
#                   name         = "FirstName",
#                   type         = "String",
#                   physicalType = "nvarchar"
#                 }
#               },
#               {
#                 source = {
#                   name         = "MiddleName",
#                   type         = "String",
#                   physicalType = "nvarchar"
#                 },
#                 sink = {
#                   name         = "MiddleName",
#                   type         = "String",
#                   physicalType = "nvarchar"
#                 }
#               },
#               {
#                 source = {
#                   name         = "LastName",
#                   type         = "String",
#                   physicalType = "nvarchar"
#                 },
#                 sink = {
#                   name         = "LastName",
#                   type         = "String",
#                   physicalType = "nvarchar"
#                 }
#               },
#               {
#                 source = {
#                   name         = "EmailPromotion",
#                   type         = "Int32",
#                   physicalType = "int"
#                 },
#                 sink = {
#                   name         = "EmailPromotion",
#                   type         = "Int32",
#                   physicalType = "int"
#                 }
#               }
#             ],
#             typeConversion = true,
#             typeConversionSettings = {
#               allowDataTruncation  = true,
#               treatBooleanAsNumber = false
#             }
#           }
#         }

#       }
#     ]
#   )

#   lifecycle {
#     create_before_destroy = true
#   }

#   count = var.is_self_hosted_ir_setup_finished ? 1 : 0
# }
