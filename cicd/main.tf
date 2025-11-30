
resource "azurerm_resource_group" "terraform_rg" {
  name     = "myterraformRGName0001"
  location = "East US"
  tags = {
    Project = "azuretf"
    Owner   = "ajmc"
    Env     = "dev"
  }
}
