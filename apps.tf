module "octo_buddy" {
  source = "./modules/github-app"
  providers = {
    github = github
  }

  app_id          = 4944088
  client_id       = "Iv23linVfoDqgbsPv65f"
  installation_id = "161714415"

  repositories = [
    module.actions.name,
    module.claude_ops.name,
    module.git_ops.name,
    module.github_ops.name,
  ]
}
