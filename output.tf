output "resource_group" {
  value = var.resource_group_create == true ? azurerm_resource_group.main : data.azurerm_resource_group.main
}