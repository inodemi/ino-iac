provider "cloudflare" {
  token = "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"
  owner = "inodemi"
}

module "cloudflare" {
  source        = "../../../../../modules/network/cloudflare/zones"
  zone          = "inodemi.com"
}
