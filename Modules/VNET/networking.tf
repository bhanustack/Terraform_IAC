resource "azurerm_resource_group" "example" {
    name = var.rsg_name
    location = var.rsg_location
      
}

resource "azurerm_virtual_network" "example" {
    name = var.vnet_name
    location = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    address_space = [var.vnet_cidr]
  
}

resource "azurerm_subnet" "internal" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.example.name
    virtual_network_name = azurerm_resource_group.example.name
    address_prefixes = [var.subnet_cidr]
  
}

output "subnet_id" {
    value = azurerm_subnet.internal.id
  
}

output "rsg_name_output" {
    value = azurerm_resource_group.example.name
  
}

output "rsg_location_out" {
    value = azurerm_resource_group.example.location
  
}