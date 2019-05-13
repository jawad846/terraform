resource "azurerm_application_security_group" "sg_server" {
  name                = "sg_server"
  location            = "${azurerm_resource_group.az_rg.location}"
  resource_group_name = "${azurerm_resource_group.az_rg.name}"
}