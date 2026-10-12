resource "azurerm_firewall" "firewall1" {
    for_each = var.firewall
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = data.azurerm_subnet.data_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }
}

data "azurerm_subnet" "data_subnet" {
  for_each = var.firewall
  name                 = each.value.subnet_data
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip_data" {
  for_each            = var.firewall
  name                = each.value.pip_data_name
  resource_group_name = each.value.resource_group_name
}

