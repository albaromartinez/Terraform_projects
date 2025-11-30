
variable "resource_group_name" {
  default = "name of resource group"
  type    = string
}

variable "resource_group_location" {
  description = "location"
  type        = string
}

variable "prefix_name" {
  description = "prefix name defined in locals"
  type = string
}
