resource "github_repository" "repository" {
  count       = var.env =="dev" ? 1:0
  name        = "${var.unit}-${var.code}-${var.feature}"
  description = "Repository for ${var.unit}-${var.code}-${var.feature} service"
  visibility  = "public"
  auto_init   = "true"
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch" "dev" {
  count      = var.env =="dev" ? 1:0
  repository = github_repository.repo[0].name
  branch     = "dev"
}