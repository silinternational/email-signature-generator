
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

