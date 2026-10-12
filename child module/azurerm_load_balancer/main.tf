resource "azurerm_lb" "loadbalancer" {
    for_each = var.lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }
}

data "azurerm_public_ip" "pip_data" {
  for_each            = var.lb
  name                = each.value.pip_data_name
  resource_group_name = each.value.resource_group_name
}