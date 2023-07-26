
provider "azurerm" {
  features {}
  alias = "resource_group"
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
} 

locals {
  resource_group_name = length(var.resource_group_name_suffix) > 0 ? "${var.resource_group_name_prefix}-${var.resource_group_base_name}-${var.resource_group_name_suffix}" : "${var.resource_group_name_prefix}-${var.resource_group_base_name}"
}

resource "azurerm_resource_group" "main" {
  count    = var.resource_group_create == true ? 1 : 0
  name     = local.resource_group_name
  location = var.resource_group_location
  provider = azurerm.resource_group
}

data "azurerm_resource_group" "main" {
  count = var.resource_group_create == true ? 0 : 1
  name  = local.resource_group_name
  tags = var.tags
  provider = azurerm.resource_group
  lifecycle {
    ignore_changes = [ tags ]
  }
}

resource "azurerm_role_assignment" "permission" {
  for_each             = var.resource_group_role_assignments
  scope                = azurerm_resource_group.main[0].id
  role_definition_name = each.value
  principal_id         = each.key
  provider = azurerm.resource_group
}
