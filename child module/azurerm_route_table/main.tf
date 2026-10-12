resource "azurerm_route_table" "route_table" {
    for_each = var.rb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  route {
    name           = each.value.route_name
    address_prefix = each.value.address_prefix
    next_hop_type  = "Internet"
  }
}