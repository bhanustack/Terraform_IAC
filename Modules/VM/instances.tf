resource "azurerm_resource_group" "example" {
  name                = var.rsg_name
  location            = var.rsg_location

}

resource "azurerm_network_interface" "main" {
  name = var.nic_name
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  
  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = var.nic_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vm_name
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.user_name
    admin_password = var.user_pwd
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = var.vm_enviornment
  }
}

