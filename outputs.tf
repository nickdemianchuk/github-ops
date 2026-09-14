output "repos" {
  value = {
    actions    = module.actions.full_name
    claude_ops = module.claude_ops.full_name
    github_ops = module.github_ops.full_name
  }
}

output "version" {
  value = var.release_version
}

output "github_app" {
  value = {
    app_id = module.octo_buddy.app_id
  }
}
