resource "azurerm_resource_group" "rg-1" {
    for_each = var.rg
  name     = each.value.name
  location = each.value.location
}

