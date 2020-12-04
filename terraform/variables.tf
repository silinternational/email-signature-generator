variable "aws_region" {
  default = "us-east-1"
}

variable "aws_access_key" {
}

variable "aws_secret_key" {
}

variable "cloudflare_email" {
}

variable "cloudflare_token" {
}

variable "cloudflare_domain" {
}

variable "app_bucket_name" {
}

variable "app_cert_domain" {
}

variable "subdomain" {
}

variable "tf_remote_common" {
}

variable "app_aliases" {
  type        = list(string)
  description = "List of domains (FQDNs) to serve UI app on"
}

