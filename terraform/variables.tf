variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "Central India"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
  default     = "devops-test-vnet"
}

variable "acr_name" {
  type        = string
  description = "Azure Container Registry name (must be globally unique)"
}

variable "aks_name" {
  type        = string
  description = "AKS cluster name"
}

variable "aks_node_count" {
  type        = number
  description = "Number of AKS nodes"
  default     = 1
}

variable "aks_vm_size" {
  type        = string
  description = "AKS node VM size"
  default     = "Standard_B2s"
}

variable "mysql_server_name" {
  type        = string
  description = "MySQL Flexible Server name (must be globally unique)"
}

variable "mysql_admin_user" {
  type        = string
  description = "MySQL administrator username"
  default     = "adminuser"
}

variable "mysql_admin_password" {
  type        = string
  description = "MySQL administrator password - store in Key Vault, do NOT hardcode"
  sensitive   = true
}

variable "mysql_db_name" {
  type        = string
  description = "MySQL database name"
  default     = "appdb"
}

variable "key_vault_name" {
  type        = string
  description = "Azure Key Vault name (must be globally unique)"
}
