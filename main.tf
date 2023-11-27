
locals {
  resource_group_name = length(var.resource_group_name_suffix) > 0 ? "${var.resource_group_name_prefix}-${var.resource_group_base_name}-${var.resource_group_name_suffix}" : length(var.resource_group_name_prefix) > 0 ? "${var.resource_group_name_prefix}-${var.resource_group_base_name} : var.resource_group_base_name"
}

resource "azurerm_resource_group" "main" {
  count    = var.resource_group_create == true ? 1 : 0
  name     = local.resource_group_name
  location = var.resource_group_location
  tags = var.tags
  lifecycle {
    ignore_changes = [ tags ]
  }
}

data "azurerm_resource_group" "main" {
  count = var.resource_group_create == true ? 0 : 1
  name  = local.resource_group_name
}
