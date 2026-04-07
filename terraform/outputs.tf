# TODO: Candidate must add outputs for all provisioned resources

output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "Resource group location"
  value       = azurerm_resource_group.rg.location
}

# TODO: Add outputs after completing the resources
# output "acr_login_server" {
#   description = "ACR login server URL"
#   value       = azurerm_container_registry.acr.login_server
# }

# output "aks_cluster_name" {
#   description = "AKS cluster name"
#   value       = azurerm_kubernetes_cluster.aks.name
# }

# output "aks_kube_config" {
#   description = "AKS kubeconfig"
#   value       = azurerm_kubernetes_cluster.aks.kube_config_raw
#   sensitive   = true
# }

# output "mysql_fqdn" {
#   description = "MySQL server FQDN"
#   value       = azurerm_mysql_flexible_server.mysql.fqdn
# }

# output "key_vault_uri" {
#   description = "Key Vault URI"
#   value       = azurerm_key_vault.kv.vault_uri
# }
