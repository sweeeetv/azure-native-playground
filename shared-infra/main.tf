resource "azurerm_resource_group" "shared" {
  name     = "rg-playground-shared-infra"
  location = "Australia Southeast"
  
  tags = {
    project = "az-playground"
    environment = "labs"
  }
}

#shared ACR
resource "azurerm_container_registry" "shared_acr" {
  name                = "plygrndsharedacr" #alphanumeric only, globally unque.
  resource_group_name = azurerm_resource_group.shared.name
  location            = azurerm_resource_group.shared.location
  sku                 = "Standard"
  admin_enabled       = true #allows to push/pull via docker easily, later use roles and identity.
  lifecycle {
    prevent_destroy = true
  }
}

//by default, acr is public over the internet, use private endpoint, firewall rules and vnet to restrict access to the registry, and allow only from trusted network.