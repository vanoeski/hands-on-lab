terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "az-learning-evan"

    workspaces {
      name = "hands-on_with_terraform_on_azure"
    }
  }
}

provider "azurerm" {
  features {
  }
  skip_provider_registration = true
  subscription_id = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-4d27c76c-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source  = "app.terraform.io/az-learning-evan/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "strodeny8888"
}