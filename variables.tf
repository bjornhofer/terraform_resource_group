variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
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
