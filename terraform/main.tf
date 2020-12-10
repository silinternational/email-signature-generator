// Create S3 bucket for static webapp hosting with cloudfront distro in front of it
// docs: https://registry.terraform.io/modules/fillup/hugo-s3-cloudfront/aws/3.0.0
module "app" {
  source  = "fillup/hugo-s3-cloudfront/aws"
  version = "4.1.0"

  aliases             = var.app_aliases
  bucket_name         = var.app_bucket_name
  cert_domain         = var.app_cert_domain
  cf_default_ttl      = "0"
  cf_min_ttl          = "0"
  cf_max_ttl          = "0"
  origin_path         = "/public"
  s3_origin_id        = "s3-origin"
  deployment_user_arn = data.terraform_remote_state.common.outputs.codeship_arn
  custom_error_response = [
    {
      error_code         = 404
      response_code      = 200
      response_page_path = "/index.html"
    },
  ]
}

// Create DNS CNAME record on Cloudflare for app
resource "cloudflare_record" "static" {
  zone_id    = data.cloudflare_zones.domain.zones[0].id
  name       = var.subdomain
  type       = "CNAME"
  value      = module.app.cloudfront_hostname
  proxied    = true
  depends_on = [module.app]
}

data "cloudflare_zones" "domain" {
  filter {
    name        = var.cloudflare_domain
    lookup_type = "exact"
    status      = "active"
  }
}

resource "null_resource" "force_apply" {
  triggers = {
    time = timestamp()
  }
}
