variable "azurevm_admin_username" {
  default = "adminuser"
}

variable "mssql_admin_username" {
  default = "adminuser"
}

variable "sqlserver_admin_username" {
  default = "sa"
}

variable "resource_group_name" {
  default = "database-sync"
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
  default = false
}

variable "is_create_vpn_gateway" {
  default = true
}

variable "my_client_ip" {
  default = "10.10.10.10"
}

variable "azurevm_admin_password" {
  default = "P@ssw0rdDummy"
}

variable "mssql_admin_password" {
  default = "P@ssw0rdDummy"
}

variable "sqlserver_admin_password" {
  default = "P@ssw0rdDummy"
}
