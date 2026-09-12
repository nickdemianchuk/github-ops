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
