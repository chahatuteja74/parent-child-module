resource "azurerm_network_interface" "nic1" {
    for_each = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "data_subnet" {
  for_each = var.nics
  name                 = each.value.subnet_data
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

