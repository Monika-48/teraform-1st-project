resource "azurerm_resource_group" "terra" {
  name     = "terra"
  location = "East US"
}

resource "azurerm_virtual_network" "terra_vnet" {
    name                = "terra-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.terra.location
    resource_group_name = azurerm_resource_group.terra.name
}
 
resource "azurerm_subnet" "subnet1" {
    name                 = "subnet1"
    resource_group_name  = azurerm_resource_group.terra.name
    virtual_network_name = azurerm_virtual_network.terra_vnet.name
    address_prefixes     = ["10.0.1.0/24"]
}
 
resource "azurerm_subnet" "subnet2" {
    name                 = "subnet2"
    resource_group_name  = azurerm_resource_group.terra.name
    virtual_network_name = azurerm_virtual_network.terra_vnet.name
    address_prefixes     = ["10.0.2.0/24"]
}