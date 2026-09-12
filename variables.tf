variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type        = string
  description = "GitHub username or org"
}
