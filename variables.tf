variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type        = string
  description = "GitHub username or org"
}

variable "release_version" {
  type        = string
  description = "Version of the release being applied"
  default     = null
}

variable "octo_buddy_private_key" {
  type        = string
  sensitive   = true
  description = "PEM private key for the octo-buddy GitHub App"
}
