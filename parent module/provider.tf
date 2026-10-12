terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.7.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ado-rg"
    storage_account_name = "adostorage23"
    container_name       = "yaml"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
