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



//user assigned identity for container apps to pull image from this ACR
resource "azurerm_user_assigned_identity" "aca_user_assigned_identity" {
  name                = "user-assigned-identity-aca-shared-infra"
  resource_group_name = azurerm_resource_group.shared.name
  location            = azurerm_resource_group.shared.location
}
resource "azurerm_role_assignment" "acrpull_for_aca" {
  scope                = azurerm_container_registry.shared_acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.aca_user_assigned_identity.principal_id
}


//by default, acr is public over the internet, use private endpoint, firewall rules and vnet to restrict access to the registry, and allow only from trusted network.