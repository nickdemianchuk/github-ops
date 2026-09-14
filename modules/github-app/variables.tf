variable "app_id" {
  type        = number
  description = "Numeric GitHub App ID, used as the ruleset bypass actor"
}

variable "client_id" {
  type        = string
  description = "GitHub App Client ID, used to mint installation tokens in CI"
}

variable "installation_id" {
  type        = number
  description = "Numeric installation ID of the App on this account"
}

variable "repositories" {
  type = list(string)
  validation {
    condition     = length(var.repositories) > 0
    error_message = "At least one repository is required; GitHub Apps cannot be installed with zero repos selected."
  }
}
