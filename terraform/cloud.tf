terraform {
  cloud {
    organization = "gtis"

    workspaces {
      tags = ["app:email-signature-generator"]
    }
  }
}
