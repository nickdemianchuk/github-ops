variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "visibility" {
  type    = string
  default = "private"
  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Must be public or private."
  }
}

variable "topics" {
  type    = list(string)
  default = []
}

variable "has_issues" {
  type    = bool
  default = true
}

variable "delete_branch_on_merge" {
  type    = bool
  default = true
}

variable "rulesets" {
  type = list(object({
    name        = string
    target      = optional(string, "branch")
    enforcement = optional(string, "active")
    conditions = optional(object({
      ref_name = object({
        include = list(string)
        exclude = list(string)
      })
    }))
    rules = object({
      creation         = optional(bool)
      deletion         = optional(bool)
      non_fast_forward = optional(bool)
      update           = optional(bool)
      pull_request = optional(object({
        required_approving_review_count   = optional(number, 1)
        dismiss_stale_reviews_on_push     = optional(bool, true)
        require_code_owner_review         = optional(bool, false)
        require_last_push_approval        = optional(bool, false)
        required_review_thread_resolution = optional(bool, false)
      }))
      required_status_checks = optional(object({
        strict_required_status_checks_policy = optional(bool, false)
        required_check = list(object({
          context        = string
          integration_id = optional(number)
        }))
      }))
    })
  }))
  default = []
}

variable "webhooks" {
  type = list(object({
    url          = string
    content_type = optional(string, "json")
    events       = list(string)
    active       = optional(bool, true)
    secret       = optional(string)
  }))
  default = []
}

variable "collaborators" {
  type = list(object({
    username   = string
    permission = optional(string, "push")
  }))
  default = []
}

variable "actions_secrets" {
  type    = map(string)
  default = {}
}

variable "actions_variables" {
  type    = map(string)
  default = {}
}

