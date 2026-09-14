module "actions" {
  source = "./modules/github-repo"
  providers = {
    github = github
  }

  name        = "actions"
  description = "Reusable GitHub Actions workflows"
  visibility  = "public"
  topics      = ["github-actions", "ci-cd"]

  actions_variables = {
    OCTO_BUDDY_CLIENT_ID = module.octo_buddy.client_id
  }
  actions_secrets = {
    OCTO_BUDDY_PRIVATE_KEY = var.octo_buddy_private_key
  }

  rulesets = [
    {
      name        = "Default branch"
      target      = "branch"
      enforcement = "active"
      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
          exclude = []
        }
      }
      bypass_actors = [module.octo_buddy.bypass_actor]
      rules = {
        deletion         = true
        non_fast_forward = true
        required_status_checks = {
          strict_required_status_checks_policy = false
          required_check = [
            { context = "lint-commits / validate-commit-messages" },
            { context = "lint-pr / validate-pr-body" },
            { context = "lint-pr / validate-pr-title" },
          ]
        }
      }
    },
    {
      name        = "Disable tag deletion"
      target      = "tag"
      enforcement = "active"
      rules = {
        deletion = true
      }
    }
  ]
}

module "claude_ops" {
  source = "./modules/github-repo"
  providers = {
    github = github
  }

  name        = "claude-ops"
  description = "Personal Claude configs"
  visibility  = "public"
  topics      = ["claude", "ai"]

  actions_variables = {
    OCTO_BUDDY_CLIENT_ID = module.octo_buddy.client_id
  }
  actions_secrets = {
    OCTO_BUDDY_PRIVATE_KEY = var.octo_buddy_private_key
  }

  rulesets = [
    {
      name        = "Default branch"
      target      = "branch"
      enforcement = "active"
      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
          exclude = []
        }
      }
      bypass_actors = [module.octo_buddy.bypass_actor]
      rules = {
        deletion         = true
        non_fast_forward = true
        required_status_checks = {
          strict_required_status_checks_policy = false
          required_check = [
            { context = "lint-commits / validate-commit-messages" },
            { context = "lint-pr / validate-pr-body" },
            { context = "lint-pr / validate-pr-title" },
          ]
        }
      }
    },
    {
      name        = "Disable tag deletion"
      target      = "tag"
      enforcement = "active"
      rules = {
        deletion = true
      }
    }
  ]
}

module "git_ops" {
  source = "./modules/github-repo"
  providers = {
    github = github
  }

  name        = "git-ops"
  description = "git configs and helpers"
  visibility  = "public"
  topics      = ["git"]

  actions_variables = {
    OCTO_BUDDY_CLIENT_ID = module.octo_buddy.client_id
  }
  actions_secrets = {
    OCTO_BUDDY_PRIVATE_KEY = var.octo_buddy_private_key
  }

  rulesets = [
    {
      name        = "Default branch"
      target      = "branch"
      enforcement = "active"
      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
          exclude = []
        }
      }
      bypass_actors = [module.octo_buddy.bypass_actor]
      rules = {
        deletion         = true
        non_fast_forward = true
        required_status_checks = {
          strict_required_status_checks_policy = false
          required_check = [
            { context = "lint-commits / validate-commit-messages" },
            { context = "lint-pr / validate-pr-body" },
            { context = "lint-pr / validate-pr-title" },
          ]
        }
      }
    },
    {
      name        = "Disable tag deletion"
      target      = "tag"
      enforcement = "active"
      rules = {
        deletion = true
      }
    }
  ]
}

module "github_ops" {
  source = "./modules/github-repo"
  providers = {
    github = github
  }

  name        = "github-ops"
  description = "All things GitHub, managed via Terraform"
  visibility  = "public"
  topics      = ["terraform", "github", "iac"]

  actions_variables = {
    OCTO_BUDDY_CLIENT_ID = module.octo_buddy.client_id
  }
  actions_secrets = {
    OCTO_BUDDY_PRIVATE_KEY = var.octo_buddy_private_key
  }

  rulesets = [
    {
      name        = "Default branch"
      target      = "branch"
      enforcement = "active"
      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
          exclude = []
        }
      }
      bypass_actors = [module.octo_buddy.bypass_actor]
      rules = {
        deletion         = true
        non_fast_forward = true
        required_status_checks = {
          strict_required_status_checks_policy = false
          required_check = [
            { context = "lint-commits / validate-commit-messages" },
            { context = "lint-pr / validate-pr-body" },
            { context = "lint-pr / validate-pr-title" },
          ]
        }
      }
    },
    {
      name        = "Disable tag deletion"
      target      = "tag"
      enforcement = "active"
      rules = {
        deletion = true
      }
    }
  ]
}
