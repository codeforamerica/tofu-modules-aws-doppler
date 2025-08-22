locals {
  environments = {
    "production"  = "prod"
    "staging"     = "stg"
    "development" = "dev"
  }
  programs = {
    "tax-benefits" = "tax"
  }
  program = (var.program != null
    ? (contains(keys(local.programs), var.program) ? local.programs[var.program] : var.program)
    : null
  )
  integration = join("-", compact([local.project, var.environment, "asm"]))
  path        = join("/", compact([var.project, var.environment, var.service]))
  project     = coalesce(var.doppler_project, join("-", compact([local.program, var.project, var.service])))
}
