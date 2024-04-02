
terraform {
  required_version = ">= 1.0"
  required_providers {
    cloudflare = {
      version = "~> 3.0"
      source  = "cloudflare/cloudflare"
    }
  }
}
