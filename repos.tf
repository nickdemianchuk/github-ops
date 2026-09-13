module "actions" {
  source = "./modules/github-repo"
  providers = {
    github = github
  }

  name        = "actions"
  description = "Reusable GitHub Actions workflows"
  visibility  = "public"
  topics      = ["github-actions", "ci-cd"]

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
          actor_id   = 5
          actor_type = "RepositoryRole"
        }
      ]
      rules = {
        deletion         = true
        non_fast_forward = true
        required_status_checks = {
          strict_required_status_checks_policy = false
          required_check = [
            { context = "lint-commits" },
            { context = "lint-pr" },
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
          actor_id   = 5
          actor_type = "RepositoryRole"
        }
      ]
      rules = {
        deletion         = true
        non_fast_forward = true
        required_status_checks = {
          strict_required_status_checks_policy = false
          required_check = [
            { context = "lint-commits / lint-commits" },
            { context = "lint-pr / lint-pr" },
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
          actor_id   = 5
          actor_type = "RepositoryRole"
        }
      ]
      rules = {
        deletion         = true
        non_fast_forward = true
        required_status_checks = {
          strict_required_status_checks_policy = false
          required_check = [
            { context = "lint-commits / lint-commits" },
            { context = "lint-pr / lint-pr" },
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
