output "app_id" {
  value = var.app_id
}

output "client_id" {
  value = var.client_id
}

output "bypass_actor" {
  value = {
    actor_id   = var.app_id
    actor_type = "Integration"
  }
}
