
module "pages" {
  source  = "silinternational/pages/cloudflare"
  version = "0.2.0"

  cloudflare_account_id = var.cloudflare_account_id
  project_name          = var.project_name
  repo_name             = var.repo_name
  repo_owner            = var.repo_owner
  domain                = var.cloudflare_domain
  subdomain             = var.pages_subdomain
}
