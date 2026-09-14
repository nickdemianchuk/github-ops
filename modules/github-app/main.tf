terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

resource "github_app_installation_repositories" "this" {
  installation_id       = var.installation_id
  selected_repositories = var.repositories
}
