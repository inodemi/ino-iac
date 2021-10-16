variable "unit" {
  type        = string
  description = "business unit code e.g ino"
  default     = "ino"
}

variable "code" {
  type        = string
  description = "service domain code e.g iac (infrastructure as code)"
  default     = "iac"
}

#secrets
variable "github_owner" {
  type        = string
  description = "Github owner value from tfvars"
}

variable "github_token" {
  type        = string
  description = "Github owner value from tfvars"
}
