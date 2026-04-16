output "app_public_ip" {
  value = azurerm_public_ip.app.ip_address
}

output "db_private_ip" {
  value = azurerm_network_interface.db_nic.private_ip_address
}