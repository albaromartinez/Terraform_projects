
resource "azurerm_resource_group" "terraform_rg" {
  name     = var.name
  location = var.location
  tags = var.tags
}