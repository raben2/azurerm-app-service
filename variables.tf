variable "environment" {
  type        = string
  description = "environment"
  default     = "develop"
}

variable "app_name" {
  type        = string
  description = "application name"
}

variable "location" {
  type        = string
  description = "Azure resource location"

}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "system_variant" {
  type        = string
  description = "OS of the app service"
  default     = "linux"
}

variable "reserved" {
  type    = bool
  default = true
}

variable "sku_tier" {
  type    = string
  default = "Basic"
}

variable "sku_size" {
  type        = string
  description = "instance type"
  default     = "B1"
}

variable "sku_capacity" {
  type        = number
  description = "number of replicas"
  default     = 1
}

variable "app_settings" {
  description = "Application settings for App Service."
  type        = map(string)
  default     = {}
}

variable "site_config" {
  description = "Site config for App Service"
  type        = any
  default     = {}
}
variable "connection_strings" {
  description = "Connection strings for App Service"
  type        = list(map(string))
  default     = []
}

variable "https_only" {
  description = "HTTPS restriction for App Service."
  type        = string
  default     = "true"
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = map(string)
  default     = {}
}

variable "app_service_plan_id" {
  description = "id of the service plan"
  type        = string
  default     = ""
}
