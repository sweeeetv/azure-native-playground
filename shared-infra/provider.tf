//download 'plugins' to talk to the azure api

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0" #stable
    }
  }
}

provider "azurerm" {
  features {} #required
}