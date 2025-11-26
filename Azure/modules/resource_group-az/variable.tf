variable "location" {
  description = "Location where the resource group will be deployed"
  type        = string
}

variable "name" {
  description = "The name of the resource group"
  type        = string
  
}
variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)

}