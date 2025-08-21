locals {
  name = join("-", compact([var.project, var.environment, var.service, "doppler"]))
}
