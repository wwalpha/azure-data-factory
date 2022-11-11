resource "azurerm_data_factory_pipeline" "copy_table_to_storage" {
  name            = "copy_table_to_storage"
  data_factory_id = azurerm_data_factory.this.id
  activities_json = jsonencode(
    [
      {
        "name" : "copy_to_storage",
        "type" : "Copy",
        "inputs" : [
          {
            "parameters" : {},
            "referenceName" : "${azurerm_data_factory_custom_dataset.address[0].name}",
            "type" : "DatasetReference"
          }
        ],
        "outputs" : [
          {
            "parameters" : {},
            "referenceName" : "${azurerm_data_factory_dataset_delimited_text.this.name}",
            "type" : "DatasetReference"
          }
        ]

        "dependsOn" : [],
        "policy" : {
          "timeout" : "0.12:00:00",
          "retry" : 0,
          "retryIntervalInSeconds" : 30,
          "secureOutput" : false,
          "secureInput" : false
        },
        "userProperties" : [],
        "typeProperties" : {
          "source" : {
            "type" : "SqlServerSource",
            "queryTimeout" : "02:00:00",
            "partitionOption" : "None"
          },
          "sink" : {
            "type" : "DelimitedTextSink",
            "storeSettings" : {
              "type" : "AzureBlobStorageWriteSettings"
            },
            "formatSettings" : {
              "type" : "DelimitedTextWriteSettings",
              "quoteAllText" : true,
              "fileExtension" : ".csv"
            }
          },
          "enableStaging" : false
        },

      }
    ]
  )

  count = var.is_self_hosted_ir_setup_finished ? 1 : 0
}
