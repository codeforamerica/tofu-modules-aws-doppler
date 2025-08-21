resource "doppler_integration_aws_secrets_manager" "this" {
  name            = join("-", [var.project, var.environment, var.service, "asm"])
  assume_role_arn = var.iam_role_arn
}

resource "doppler_secrets_sync_aws_secrets_manager" "this" {
  integration = doppler_integration_aws_secrets_manager.this.id
  project     = local.project
  config      = coalesce(var.environment_slug, local.environments[var.environment])

  region               = data.aws_region.current.name
  path                 = join("/", [var.project, var.environment, var.service])
  delete_behavior      = "leave_in_target"
  path_behavior        = "none"
  sync_strategy        = "multi-secret"
  update_metadata      = false
  update_resource_tags = "never"
}
