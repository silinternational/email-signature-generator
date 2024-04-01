variable "aws_region" {
  default = "us-east-1"
}

variable "aws_access_key" {
}

variable "aws_secret_key" {
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


/*
 * AWS tag values
 */

variable "app_customer" {
  description = "customer name to use for the itse_app_customer tag"
  type        = string
  default     = "sil"
}

variable "app_environment" {
  description = "environment name to use for the itse_app_environment tag, e.g. staging, production"
  type        = string
  default     = "production"
}

variable "app_name" {
  description = "app name to use for the itse_app_name tag"
  type        = string
  default     = "email-signature-generator"
}

/*
 * Cloudflare Pages variables
 */
variable "cloudflare_account_id" {
  description = "Cloudflare account number"
  type        = string
}

variable "cloudflare_domain" {
  description = "DNS domain on Cloudflare"
  type        = string
}

variable "cloudflare_token" {
  description = "The Cloudflare API token"
  type        = string
  default     = ""
}

variable "project_name" {
  description = "Cloudflare Pages project name"
  type        = string
  default     = "email-signature-generator"
}

variable "repo_name" {
  description = "GitHub repository name"
  type        = string
  default     = "email-signature-generator"
}

variable "repo_owner" {
  description = "GitHub repository owner"
  type        = string
  default     = "silinternational"
}

variable "pages_subdomain" {
  description = "DNS subdomain for hosting the Cloudflare Pages project"
  type        = string
}

