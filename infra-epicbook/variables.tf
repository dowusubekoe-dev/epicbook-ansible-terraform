variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus2"
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "epicbook-rg"
}

variable "vnet_cidr" {
  description = "VNet CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "app_subnet_cidr" {
  description = "App subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  description = "DB subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "admin_username" {
  description = "Admin username for all VMs"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "Path to SSH public key"
  type        = string
}