resource "azurerm_resource_group" "rg" {
  name     = "epicbook-rg"
  location = var.location
}