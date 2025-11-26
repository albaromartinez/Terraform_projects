variable "resource_group_name" {
  description = "Name of resource group name"
  type        = string
}



variable "name" {
  description = "The name of the storage account"
  type        = string
}



variable "location" {
  description = "Location where it will be deploy"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)

}