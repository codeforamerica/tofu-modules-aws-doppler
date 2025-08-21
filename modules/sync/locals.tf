locals {
  environments = {
    "production"  = "prod"
    "staging"     = "stg"
    "development" = "dev"
  }
  integration = join("-", compact([local.project, var.environment, "asm"]))
  path = join("/", compact([var.project, var.environment, var.service]))
  project = coalesce(var.doppler_project, join("-", compact([var.project, var.service])))
}
