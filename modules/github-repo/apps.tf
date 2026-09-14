resource "github_app_installation_repository" "this" {
  for_each        = var.apps
  installation_id = each.value.installation_id
  repository      = github_repository.this.name
}
