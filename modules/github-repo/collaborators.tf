resource "github_repository_collaborator" "this" {
  for_each   = { for c in var.collaborators : c.username => c }
  repository = github_repository.this.name
  username   = each.value.username
  permission = each.value.permission
}
