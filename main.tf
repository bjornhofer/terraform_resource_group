
provider "azurerm" {
  features {}
  alias = "resource_group"
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
} 

resource "azurerm_resource_group" "main" {
  count    = var.resource_group_create == true ? 1 : 0
  name     = var.resource_group_name
  location = var.resource_group_location
  provider = azurerm.resource_group
}

data "azurerm_resource_group" "main" {
  count = var.resource_group_create == true ? 0 : 1
  name  = var.resource_group_name
  provider = azurerm.resource_group
}

resource "azurerm_role_assignment" "permission" {
  for_each             = var.resource_group_role_assignments
  scope                = azurerm_resource_group.main[0].id
  role_definition_name = each.value
  principal_id         = each.key
  provider = azurerm.resource_group
}
