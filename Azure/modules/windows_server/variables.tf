
variable "resource_group_name" {
  default = "name of resource group"
  type    = string
}

variable "resource_group_location" {
  description = "location"
  type        = string
}


variable "prefix" {
  type        = string
  description = "Prefix of the resource name"
}

variable "azurerm_storage_account" {
  description = "Storage account name"
  type        = string

}

variable "network_interface_ids" {
  description = "network interface ids"
  type        = string
}

variable "storage_account_uri" {
  description = "storage account uri"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map(string)
}
variable "admin_username" {
  description = "user name to admin the vm"
  type        = string
}
variable "random_password" {
  description = "random password"
  type        = string
}

# variable "vm_random_name" {
#   default = "VM name"
#   type    = string
# }
