//
output "acr_login_server" {
  value       = azurerm_container_registry.shared_acr.login_server
  description = "The FQDN/URL for your Docker login."
}

output "shared_rg_name" {
  value = azurerm_resource_group.shared.name
}

//
//output "managed_identity_id" {
//  value       = azurerm_user_assigned_identity.aca_identity.id
//  description = "The ID of the identity that all ACAs should use to pull images."
//}