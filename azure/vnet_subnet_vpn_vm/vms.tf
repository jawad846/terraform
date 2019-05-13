resource "azurerm_virtual_machine" "vm_server" {
  name                  = "vm_server"
  location              = "${azurerm_resource_group.az_rg.location}"
  resource_group_name   = "${azurerm_resource_group.az_rg.name}"
  network_interface_ids = ["${azurerm_network_interface.ni_vm.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "testdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "testVM1"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}