resource "azurerm_data_factory_pipeline" "storage" {
  depends_on = [
    azurerm_data_factory_custom_dataset.person,
    azurerm_data_factory_custom_dataset.csv
  ]

  name            = "copy_table_to_storage"
  data_factory_id = azurerm_data_factory.this.id
  activities_json = jsonencode(
    [
      {
        name = "copy_to_storage",
        type = "Copy"
        inputs = [
          {
            type          = "DatasetReference"
            referenceName = azurerm_data_factory_custom_dataset.person[0].name
          }
        ]
        outputs = [
          {
            type          = "DatasetReference"
            referenceName = azurerm_data_factory_custom_dataset.csv.name
          }
        ]
        typeProperties = {
          source = {
            type            = "SqlServerSource"
            queryTimeout    = "02:00:00"
            partitionOption = "None"
          }
          sink = {
            type = "DelimitedTextSink",
            storeSettings = {
              type = "AzureBlobStorageWriteSettings"
            },
            formatSettings = {
              type          = "DelimitedTextWriteSettings",
              quoteAllText  = true,
              fileExtension = ".csv"
            }
          },
          enableStaging = false
        }

      }
    ]
  )

  lifecycle {
    create_before_destroy = true
  }

  count = var.is_self_hosted_ir_setup_finished ? 1 : 0
}
