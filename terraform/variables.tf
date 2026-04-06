variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "Central India"
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
