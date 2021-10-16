provider "github" {
  token = "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"
  owner = "inodemi"
}

module "github_repository" {
  source        = "../../../../../modules/saas/github/repository"
  unit          = var.unit
  code          = var.code
  visibility    = "public"
  auto_init     = true
  has_issues    = true
  has_projects  = true
  has_wiki      = true
  source_branch = "main"
  branch_name   = "dev"
}
