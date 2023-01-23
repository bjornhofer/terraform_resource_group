resource "azurerm_resource_group" "main" {
  count    = var.resource_group_create == true ? 1 : 0
  name     = var.resource_group_name
  location = var.resource_group_location
}

data "azurerm_resource_group" "main" {
  count = var.resource_group_create == true ? 0 : 1
  name  = var.resource_group_name
}

resource "azurerm_role_assignment" "permission" {
  for_each             = var.resource_group_role_assignments
  scope                = azurerm_resource_group.main[0].id
  role_definition_name = each.value
  principal_id         = each.key
}