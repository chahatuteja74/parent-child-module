resource "azurerm_virtual_network_peering" "vp1" {
  for_each = var.vp

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = data.azurerm_virtual_network.remote[each.key].id
}

data "azurerm_virtual_network" "remote" {
  for_each = var.vp

  name                = each.value.remote_virtual_network_name
  resource_group_name = each.value.resource_group_name
}