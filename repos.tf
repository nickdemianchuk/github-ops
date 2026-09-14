module "actions" {
  source = "./modules/github-repo"
  providers = {
    github = github
  }

  name        = "actions"
  description = "Reusable GitHub Actions workflows"
  visibility  = "public"
  topics      = ["github-actions", "ci-cd"]

  apps = {
    octo_buddy = local.octo_buddy
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
      bypass_actors = [
        {
          actor_id   = local.octo_buddy.app_id
          actor_type = "Integration"
        }
      ]
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
      conditions = {
        ref_name = {
          include = ["~ALL"]
          exclude = []
        }
      }
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

  apps = {
    octo_buddy = local.octo_buddy
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
      bypass_actors = [
        {
          actor_id   = local.octo_buddy.app_id
          actor_type = "Integration"
        }
      ]
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
      conditions = {
        ref_name = {
          include = ["~ALL"]
          exclude = []
        }
      }
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

  apps = {
    octo_buddy = local.octo_buddy
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
      bypass_actors = [
        {
          actor_id   = local.octo_buddy.app_id
          actor_type = "Integration"
        }
      ]
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
      conditions = {
        ref_name = {
          include = ["~ALL"]
          exclude = []
        }
      }
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

  apps = {
    octo_buddy = local.octo_buddy
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
      bypass_actors = [
        {
          actor_id   = local.octo_buddy.app_id
          actor_type = "Integration"
        }
      ]
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
      conditions = {
        ref_name = {
          include = ["~ALL"]
          exclude = []
        }
      }
      rules = {
        deletion = true
      }
    }
  ]
}
