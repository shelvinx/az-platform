variable "HCP_CLIENT_SECRET" {
  description = "The client secret for HCP"
  type        = string
  sensitive   = true
}

variable "HCP_CLIENT_ID" {
  description = "The client ID for HCP"
  type        = string
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  description = "The tenant ID for ARM"
  type        = string
  sensitive   = true
}

variable "workload" {
    type = string
}

variable "location" {
    type = string
}

variable "resource_group_name" {
    type = string
}