terraform {
  backend "s3" {
    bucket  = "ino-dev-storage-s3-terraform"
    region  = "ap-southeast-1"
    key     = "ino-security-kms-dev.tfstate"
    profile = "ino-dev"
  }
}

data "local_file" "kms_policy" {
  filename = "${path.module}/policy.json"
}

module "kms" {
  source                   = "../../../../modules/security/kms"
  region                   = var.region
  unit                     = var.unit
  env                      = var.env
  code                     = var.code
  feature                  = var.feature
  sub                      = var.sub
  key_usage                = "ENCRYPT_DECRYPT"
  enable_key_rotation      = true
  deletion_window_in_days  = 7
  is_enabled               = true
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  policy                   = data.local_file.kms_policy.content
}
