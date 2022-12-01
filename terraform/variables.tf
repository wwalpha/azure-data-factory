variable "azurevm_admin_username" {}

variable "azurevm_admin_password" {}

variable "mssql_admin_username" {}

variable "mssql_admin_password" {}

variable "onpremise_admin_username" {}

variable "onpremise_admin_password" {}

variable "resource_group_name" {
  default = "database-sync-rg"
}

variable "resource_group_location" {
  default = "Japan East"
}

variable "azure_vm_image_database" {
  default = "win2012-sqlserver2012-adventures-v3"
}

variable "azure_vm_image_self_hosted_ir" {
  default = "win2019-self-hosted-ir"
}

variable "azure_vm_image_resource_group" {
  default = "DEV_RG"
}

variable "is_self_hosted_ir_setup_finished" {
  default = true
}

variable "my_client_ip" {
  default = "202.32.14.177"
}
