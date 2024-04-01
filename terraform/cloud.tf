terraform {
  cloud {
    organization = "gtis"

    workspaces {
      name = "email-signature-generator"
    }
  }
}
