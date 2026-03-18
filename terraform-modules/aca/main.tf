resource "azurerm_container_app" "this" {
  name                         = var.app_name
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  registry {
    server   = split("/", var.image_name)[0] # Extracts ACR URL from image string
    identity = var.user_assigned_identity_id
  }

  ingress {
    external_enabled = true
    target_port      = var.target_port
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = var.app_name
      image  = var.image_name
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}