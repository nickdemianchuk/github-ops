plugin "github" {
  enabled = true
  source  = "github.com/integrations/tflint-ruleset-github"
  version = "0.1.0"
}

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = false
}

rule "terraform_documented_outputs" {
  enabled = false
}
