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

variable "KEYVAULT_NAME" {
    type        = string
    sensitive   = true
}

variable "tags" {
    type        = map(string)
    sensitive   = true
}

variable "workload" {
    type        = string
    sensitive   = true
}

variable "location" {
    type        = string
    sensitive   = true
}

variable "resource_group_name" {
    type        = string
    sensitive   = true
}

variable "UPN_ADMIN" {
    type        = string
    sensitive   = true
}