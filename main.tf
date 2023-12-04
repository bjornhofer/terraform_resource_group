module "naming" {
  source  = "Azure/naming/azurerm"
  suffix = [ "${var.resource_group_name_suffix}" ]
  prefix = [ "${var.resource_group_name_prefix}" ]
}

resource "azurerm_resource_group" "main" {
  count    = var.resource_group_create == true ? 1 : 0
  name     = module.naming.resource_group.name
  location = var.resource_group_location
  tags = var.tags
}
