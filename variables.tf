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

# Variables for configuration - Azure Policy
variable "policy_assignment_scope" {
  description = "Scope for policy assignment (subscription or management_group)"
  type        = string
  default     = "subscription"
  validation {
    condition     = contains(["subscription", "management_group"], var.policy_assignment_scope)
    error_message = "Policy assignment scope must be either 'subscription' or 'management_group'."
  }
}

variable "management_group_id" {
  description = "Management Group ID (required if scope is management_group)"
  type        = string
  default     = ""
}

variable "policy_mode" {
  description = "Policy enforcement mode - 'Audit' or 'Modify'"
  type        = string
  default     = "Audit"
  validation {
    condition     = contains(["Audit", "Modify"], var.policy_mode)
    error_message = "Policy mode must be either 'Audit' or 'Modify'."
  }
}