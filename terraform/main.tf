# ============================================================
# main.tf - Azure Infrastructure for DevOps Machine Test
# ============================================================
# Partial scaffold. Candidate must complete the TODOs.

# --- Resource Group (DONE) ---
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# --- Virtual Network (DONE) ---
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/8"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.240.0.0/16"]
}

# --- Azure Container Registry (TODO) ---
# TODO: Create the ACR resource
# resource "azurerm_container_registry" "acr" {
#   name                = var.acr_name
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   sku                 = "Basic"
#   admin_enabled       = false
#   # TODO: Consider using Managed Identity instead of admin credentials
# }

# --- Azure Kubernetes Service (TODO) ---
# TODO: Create the AKS cluster
# resource "azurerm_kubernetes_cluster" "aks" {
#   name                = var.aks_name
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   dns_prefix          = var.aks_name
#
#   default_node_pool {
#     name           = "default"
#     node_count     = var.aks_node_count
#     vm_size        = var.aks_vm_size
#     vnet_subnet_id = azurerm_subnet.aks_subnet.id
#   }
#
#   identity {
#     type = "SystemAssigned"
#   }
#
#   # TODO: Enable Azure Monitor / OMS agent
#   # oms_agent {
#   #   log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
#   # }
# }

# --- Azure Database for MySQL (TODO) ---
# TODO: Create MySQL Flexible Server
# resource "azurerm_mysql_flexible_server" "mysql" {
#   name                   = var.mysql_server_name
#   resource_group_name    = azurerm_resource_group.rg.name
#   location               = azurerm_resource_group.rg.location
#   administrator_login    = var.mysql_admin_user
#   administrator_password = var.mysql_admin_password  # TODO: Use Key Vault secret instead
#   sku_name               = "B_Standard_B1ms"
#   version                = "8.0.21"
#   zone                   = "1"
#
#   storage {
#     size_gb = 20
#   }
# }

# --- Azure Key Vault (TODO) ---
# TODO: Create Key Vault and store DB credentials as secrets
# data "azurerm_client_config" "current" {}
#
# resource "azurerm_key_vault" "kv" {
#   name                = var.key_vault_name
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   tenant_id           = data.azurerm_client_config.current.tenant_id
#   sku_name            = "standard"
#
#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id
#     secret_permissions = ["Get", "Set", "List", "Delete"]
#   }
# }

# --- Log Analytics Workspace for Monitoring (TODO) ---
# TODO: Create Log Analytics Workspace for Azure Monitor
# resource "azurerm_log_analytics_workspace" "law" {
#   name                = "${var.resource_group_name}-law"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }

# --- ACR Role Assignment to AKS (TODO) ---
# TODO: Grant AKS pull access to ACR
# resource "azurerm_role_assignment" "aks_acr_pull" {
#   principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.acr.id
#   skip_service_principal_aad_check = true
# }
