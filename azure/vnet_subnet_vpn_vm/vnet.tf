resource "azurerm_virtual_network" "prod" {
  name = "prod_vnet"
  resource_group_name = "${azurerm_resource_group.az_rg.name}"
  location = "${azurerm_resource_group.az_rg.location}"
  address_space = "${var.vnet_range}"
  dns_servers = "${var.dns_range}"
}

resource "azurerm_subnet" "public-1" {
  name = "sb-pub-1"
  address_prefix = "${var.public1}"
  resource_group_name = "${azurerm_resource_group.az_rg.name}"
  virtual_network_name = "${azurerm_virtual_network.prod.name}"
}

resource "azurerm_subnet" "public-2" {
  name = "sb-pub-2"
  address_prefix = "${var.public2}"
  resource_group_name = "${azurerm_resource_group.az_rg.name}"
  virtual_network_name = "${azurerm_virtual_network.prod.name}"
}

resource "azurerm_subnet" "private-2" {
  name = "sb-pvt-2"
  address_prefix = "${var.private1}"
  resource_group_name = "${azurerm_resource_group.az_rg.name}"
  virtual_network_name = "${azurerm_virtual_network.prod.name}"
}

resource "azurerm_subnet" "private-2" {
  name = "sb-pvt-2"
  address_prefix = "${var.private2}"
  resource_group_name = "${azurerm_resource_group.az_rg.name}"
  virtual_network_name = "${azurerm_virtual_network.prod.name}"
}

