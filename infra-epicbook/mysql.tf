resource "random_string" "mysql_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_mysql_flexible_server" "main" {
  name                = "epicbook-mysql-${random_string.mysql_suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login    = var.db_admin_user
  administrator_password = var.db_admin_password

  sku_name = "B_Standard_B1ms"
  version  = "8.0"

  delegated_subnet_id = azurerm_subnet.db_subnet.id
  private_dns_zone_id = azurerm_private_dns_zone.mysql_dns.id

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.mysql_dns_link
  ]
}

resource "azurerm_mysql_flexible_database" "db" {
  name                = "epicbookdb"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.main.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}