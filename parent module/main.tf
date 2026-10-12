module "azurerm_resource_group" {
  source = "../child module/azurerm_resource_group"
  rg     = var.rgs
}

module "azurerm_storage_account" {
  source     = "../child module/azurerm_storage_account"
  depends_on = [module.azurerm_resource_group]
  sg = var.sgs
}

module "azurerm_virtual_network" {
  source     = "../child module/azurerm_virtual_network"
  depends_on = [module.azurerm_resource_group]
  vnet       = var.vnet
}

module "azurerm_subnet" {
  source     = "../child module/azurerm_subnet"
  depends_on = [module.azurerm_virtual_network]
  snet       = var.snet
}

module "azurerm_public_ip" {
  source     = "../child module/azurerm_public_ip"
  depends_on = [module.azurerm_resource_group]
  ip         = var.ips
}

module "azurerm_nsg" {
  source     = "../child module/azurerm_nsg"
  depends_on = [module.azurerm_resource_group]
  nsg        = var.nsgs
}

module "azurerm_nic" {
  source     = "../child module/azurerm_nic"
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_public_ip]
  nics       = var.nics
}

module "azurerm_virtual_machine" {
  source     = "../child module/azurerm_virtual_machine"
  depends_on = [module.azurerm_resource_group, module.azurerm_nic]
  vm         = var.vms
}

module "azurerm_bastion" {
  source     = "../child module/azurerm_bastion"
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  bastion    = var.bastions
}

module "azurerm_load_balancer" {
  source     = "../child module/azurerm_load_balancer"
  depends_on = [module.azurerm_resource_group, module.azurerm_public_ip]
  lb         = var.loadbalancer
}

module "azurerm_route_table" {
  source     = "../child module/azurerm_route_table"
  depends_on = [module.azurerm_resource_group]
  rb         = var.routetable
}

module "azurerm_key_vault" {
  source     = "../child module/azurerm_key_vault"
  depends_on = [module.azurerm_resource_group]
  keyvault   = var.key_vault
}

module "azurerm_virtual_peering" {
  source     = "../child module/azurerm_virtual_peering"
  depends_on = [module.azurerm_resource_group,module.azurerm_virtual_network]
  vp   = var.vnet_peering
}

module "azurerm_firewall" {
  source     = "../child module/azurerm_firewall"
  depends_on = [module.azurerm_subnet,module.azurerm_public_ip]
  firewall =var.firewalls
}