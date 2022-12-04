resource "azurerm_availability_set" "web_availabilty_set" {
  name                = "web_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_network_interface" "web-net-interface" {
    name = "web-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "web-webserver"
        subnet_id = var.web_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}
