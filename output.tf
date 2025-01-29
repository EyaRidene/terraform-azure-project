output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "resource_group" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}