
variable "resource_group_name" {
  default = "name of resource group"
  type    = string
}

variable "resource_group_location" {
  description = "location"
  type        = string
}

variable "random_name" {
  description = "randoem names generate whit resource random to hashicorp"
  type = string
}
