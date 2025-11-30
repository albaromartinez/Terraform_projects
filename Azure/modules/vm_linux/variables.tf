variable "resource_group_name" {
  default = "name of resource group"
  type    = string
}

variable "resource_group_location" {
  description = "location"
  type        = string
}

variable "resource_group_id" {
  description = "ID of the resource group"
  type        = string
}
variable "admin_username" {
  description = "user for admin linux server"
  type        = string
}

variable "password" {
  description = "password for admin linux server"
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs"
  type        = string
}

variable "public_key" {
    description = "SSH public key for Linux VM"
    type        = string
  
}

variable "tags" {
  description = "Tags to apply to the Linux VM"
  type        = map(string)
}
variable "prefix" {
  description = "Prefix for the Linux VM name"
  type        = string
}

variable "storage_account_type" {
  description = "The size of the Linux VM"
  type        = string
  
}

variable "storage_account_uri" {
  description = "storage account uri"
  type        = string
}
