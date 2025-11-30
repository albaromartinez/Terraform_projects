
terraform {
  backend "azurerm" {
    storage_account_name = "ajmcst"
    container_name       = "states"
    resource_group_name  = "ajmc-rg"
    key                  = "dev/terraform.tfstate"
  }
}
