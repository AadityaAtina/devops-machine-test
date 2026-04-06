# TODO: Complete this file to provision Azure infrastructure
# Required resources:
# 1. Resource Group
# 2. Azure Container Registry (ACR)
# 3. Azure Kubernetes Service (AKS)

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# TODO: Add Azure Container Registry resource
# resource "azurerm_container_registry" "acr" {
#   name                = var.acr_name
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   sku                 = "Basic"
#   admin_enabled       = true
# }

# TODO: Add Azure Kubernetes Service resource
# resource "azurerm_kubernetes_cluster" "aks" {
#   name                = var.aks_name
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   dns_prefix          = var.aks_name
#
#   default_node_pool {
#     name       = "default"
#     node_count = var.aks_node_count
#     vm_size    = var.aks_vm_size
#   }
#
#   identity {
#     type = "SystemAssigned"
#   }
# }

# TODO: Add outputs
# output "acr_login_server" {
#   value = azurerm_container_registry.acr.login_server
# }
# output "kube_config" {
#   value     = azurerm_kubernetes_cluster.aks.kube_config_raw
#   sensitive = true
# }
