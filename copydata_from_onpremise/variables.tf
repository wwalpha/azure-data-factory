variable "azurevm_admin_username" {}

variable "azurevm_admin_password" {}

variable "mssql_admin_username" {}

variable "mssql_admin_password" {}

variable "onpremise_admin_username" {}

variable "onpremise_admin_password" {}

variable "azure_vm_image_name" {
  default = "win2012-sqlserver2012-adventuresV2"
}

variable "azure_vm_image_resource_group" {
  default = "DEV_RG"
}

variable "is_self_hosted_ir_setup_finished" {
  default = true
}
