//
output "acr_login_server" {
  value       = azurerm_container_registry.shared_acr.login_server
  description = "The FQDN/URL for your Docker login."
}

output "shared_rg_name" {
  value = azurerm_resource_group.shared.name
}