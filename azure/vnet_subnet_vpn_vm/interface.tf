resource "azurerm_network_interface" "ni_vm" {
  name                = "ni_vm"
  location            = "${azurerm_resource_group.az_rg.location}"
  resource_group_name = "${azurerm_resource_group.az_rg.name}"

  ip_configuration {
    name                          = "eip"
    subnet_id                     = "${azurerm_subnet.public-1.id}"
    private_ip_address_allocation = "Dynamic"
  }
}