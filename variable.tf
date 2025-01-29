variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "eastus"
}

variable "project_name" {
  type        = string
  description = "Name prefix for resources"
  default     = "terraform project"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "tfproject-rg"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "eyaridene"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  type        = string
  description = "Path to the SSH private key"
  default     = "~/.ssh/id_rsa"
}