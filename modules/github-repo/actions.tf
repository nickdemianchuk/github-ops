resource "github_actions_secret" "this" {
  for_each        = var.actions_secrets
  repository      = github_repository.this.name
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_actions_variable" "this" {
  for_each      = var.actions_variables
  repository    = github_repository.this.name
  variable_name = each.key
  value         = each.value
}

resource "github_actions_variable" "actions_runner" {
  repository    = github_repository.this.name
  variable_name = "ACTIONS_RUNNER"
  value         = var.actions_runner
}

resource "github_workflow_repository_permissions" "this" {
  repository                       = github_repository.this.name
  default_workflow_permissions     = var.actions_default_permissions
  can_approve_pull_request_reviews = false
}

resource "github_actions_variable" "app_client_id" {
  for_each      = var.apps
  repository    = github_repository.this.name
  variable_name = "${upper(each.key)}_CLIENT_ID"
  value         = each.value.client_id
}

resource "github_actions_secret" "app_private_key" {
  for_each        = var.apps
  repository      = github_repository.this.name
  secret_name     = "${upper(each.key)}_PRIVATE_KEY"
  plaintext_value = each.value.private_key
}
