
resource "azurerm_resource_group" "terraform_rg" {
  name     = var.name
  location = var.location
  tags = merge(
    var.tags, {
      Resource : "ResourceGroup"
    }
  )
  lifecycle {
    ignore_changes = [
      name
    ]
  }
}
