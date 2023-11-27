// Base Information
variable "resource_group_base_name" {
  description = "Base name for the resource group"
  type = string
}

variable "resource_group_name_prefix" {
  type = string
  default = "rg"
  description = "Prefix for the resource group name"
}

variable "resource_group_name_suffix" {
  type = string
  default = ""
  description = "Suffix for the resource group name"
}

variable "resource_group_name_separator" {
  type = string
  default = "-"
  description = "Separator which is used between suffix/prefix"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "resource_group_role_assignments" {
  type        = map(any)
  description = "Map of role assignments e.g. {'User1' : 'Reader'}"
  default     = {}
}

variable "resource_group_create" {
  type        = bool
  description = "Decide wether to create or query a resource group (true: create, false: query)"
  default     = true
}

variable "tags" {
  type = map
  description = "map of tags"
  default = {}
}
