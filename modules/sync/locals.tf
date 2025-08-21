locals {
  environments = {
    "production"  = "prod"
    "staging"     = "stg"
    "development" = "dev"
  }
  project = coalesce(var.doppler_project, join("-", compact([var.project, var.service])))
}
