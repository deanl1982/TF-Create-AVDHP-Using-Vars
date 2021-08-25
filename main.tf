# Get AzureRM Terraforn Provider
provider "azurerm" {
  version = "2.31.1" #Required for WVD
  features {}
}

# Create Resource Group - This will host all subsequent deployed resources
resource "azurerm_resource_group" "default" {
  name     = var.rgname
  location = var.region
}

# Create Workspace
resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.workspace
  location            = var.region
  resource_group_name = azurerm_resource_group.default.name

  friendly_name = var.workspacefriendlyname
  description   = var.workspacedesc
}