

terraform {
  backend "azurerm" {
    storage_account_name = "ststorageaccountyodgpv"
    container_name       = "states" 
    key                  = "dev/terraform.tfstate"
  }
}