terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "azuretfstate1"
    container_name       = "aztfstate"
    key                  = "terraform.tfstate"
  }
}
