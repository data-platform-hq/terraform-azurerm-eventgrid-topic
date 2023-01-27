variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "name" {
  type        = string
  description = "Event Grid Topic name"
}

variable "analytics_workspace_id" {
  type        = string
  description = "Resource ID of Log Analytics Workspace"
  default     = null
}

variable "analytics_destination_type" {
  type        = string
  description = "Possible values are AzureDiagnostics and Dedicated."
  default     = "Dedicated"
}

variable "enable_diagnostic_setting" {
  type        = bool
  description = "Enable diagnostic setting. var.analytics_workspace_id must be provided"
  default     = false
}
