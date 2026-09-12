resource "github_repository_webhook" "this" {
  for_each   = { for w in var.webhooks : w.url => w }
  repository = github_repository.this.name
  active     = each.value.active

  configuration {
    url          = each.value.url
    content_type = each.value.content_type
    secret       = each.value.secret
    insecure_ssl = false
  }

  events = each.value.events
}
