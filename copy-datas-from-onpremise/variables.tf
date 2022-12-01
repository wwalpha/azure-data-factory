variable "azurevm_admin_username" {}

variable "azurevm_admin_password" {}

variable "mssql_admin_username" {}

variable "mssql_admin_password" {}

variable "sqlserver_admin_username" {}

variable "sqlserver_admin_password" {}

variable "azure_vm_image_database" {
  default = "win2012-sqlserver2012-adventuresV2"
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
