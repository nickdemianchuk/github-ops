terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
  topics      = var.topics

  has_issues             = var.has_issues
  has_wiki               = false
  delete_branch_on_merge = var.delete_branch_on_merge
  allow_auto_merge       = var.allow_auto_merge
  allow_squash_merge     = true
  allow_merge_commit     = false
  allow_rebase_merge     = false
}
