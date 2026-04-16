resource "azurerm_linux_virtual_machine" "app_vm" {
  name                = "epicbook-app-vm"
  location            = var.location
  resource_group_name = var.rg_name
  size                = "Standard_B1s"

  admin_username = "azureuser"

  network_interface_ids = [azurerm_network_interface.app_nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "db_vm" {
  name                = "epicbook-db-vm"
  location            = var.location
  resource_group_name = var.rg_name
  size                = "Standard_B1s"

  admin_username = "azureuser"

  network_interface_ids = [azurerm_network_interface.db_nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
    version   = "latest"
  }
}