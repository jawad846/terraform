provider "azurerm" {
  version = "=1.24.0"
  subscription_id = "0165411a-2a7e-4bce-ae69-1e8f03098680"
}

resource "azurerm_resource_group" "az_rg" {
  name = "rg1"
  location = "West India"
}