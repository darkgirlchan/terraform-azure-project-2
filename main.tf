# Configuración del proveedor de Azure
provider "azurerm" {
  features {}

  subscription_id = "9a9423f5-191f-4227-9a44-ac940f4d1d6f" 
  tenant_id       = "4a8bf9d1-7bcd-45b8-8400-0b0e33a7bef5"
}

# Crear el grupo de recursos
resource "azurerm_resource_group" "terraform" {
  name     = "terraform-resources"
  location = "East US"  # Usar una región válida
}

# Crear una cuenta de almacenamiento
resource "azurerm_storage_account" "terraform" {
  name                     = "terraformdanna129"   # Asegúrate de que sea un nombre único
  resource_group_name      = azurerm_resource_group.terraform.name
  location                 = azurerm_resource_group.terraform.location  # Usar la misma región
  account_tier             = "Standard"
  account_replication_type = "LRS"
}