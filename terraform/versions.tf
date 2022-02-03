
terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      version = "~> 3.0"
      source  = "hashicorp/aws"
    }
    cloudflare = {
      version = "~> 3.0"
      source  = "cloudflare/cloudflare"
    }
    template = {
      version = "~> 2.2"
      source  = "hashicorp/template"
    }
  }
}
