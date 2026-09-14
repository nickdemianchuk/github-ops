# github-ops

GitHub org/repo config as Terraform, via the [`integrations/github`](https://registry.terraform.io/providers/integrations/github/latest/docs) provider.

## What it manages

Each repo is declared as an instance of the `./modules/github-repo` module (`repos.tf`), covering:

- repo metadata (description, visibility, topics)
- branch/tag rulesets
- collaborators
- secrets
- webhooks

## Adding a repo

Add a `module` block in `repos.tf` calling `./modules/github-repo`:

```hcl
module "my_new_repo" {
  source = "./modules/github-repo"
  providers = {
    github = github
  }

  name        = "my-new-repo"
  description = "What it's for"
  visibility  = "public"
  topics      = ["terraform"]

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
      rules = {
        deletion         = true
        non_fast_forward = true
      }
    }
  ]
}
```

Then open a PR — `ci` (`.github/workflows/ci.yml`) plans the change and posts it as a PR comment. Merging to `main` runs `cd` (`.github/workflows/cd.yml`), which release-tags the commit; the tag push then applies the plan and creates the repo.

```mermaid
sequenceDiagram
    participant Dev
    participant PR as Pull Request
    participant CI as ci (tf-plan)
    participant Main as main
    participant CD as cd (release + tf-apply)
    participant GH as GitHub API

    Dev->>PR: open PR
    PR->>CI: terraform plan
    CI-->>PR: post plan as comment
    PR->>Main: merge
    Main->>CD: semantic-release
    CD->>CD: tag release
    CD->>GH: terraform apply
    GH-->>GH: repo created
```

## Backend

State is stored in Terraform Cloud (`backend.tf`). Provider auth is via `github_token` / `github_owner` variables.
