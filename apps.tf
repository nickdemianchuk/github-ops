locals {
  octo_buddy = var.octo_buddy_private_key == null ? null : {
    app_id          = 4944088
    client_id       = "Iv23linVfoDqgbsPv65f"
    installation_id = "161714415"
    private_key     = var.octo_buddy_private_key
  }

  apps = local.octo_buddy == null ? {} : {
    octo_buddy = local.octo_buddy
  }

  app_bypass_actors = local.octo_buddy == null ? [] : [
    {
      actor_id   = local.octo_buddy.app_id
      actor_type = "Integration"
    }
  ]
}
