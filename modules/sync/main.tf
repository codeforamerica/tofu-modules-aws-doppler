resource "doppler_integration_aws_secrets_manager" "this" {
  name            = local.integration
  assume_role_arn = var.iam_role_arn
}

resource "doppler_secrets_sync_aws_secrets_manager" "this" {
  integration = doppler_integration_aws_secrets_manager.this.id
  project     = local.project
  config      = coalesce(var.environment_slug, local.environments[var.environment])

  region               = var.region
  path                 = local.path
  delete_behavior      = "leave_in_target"
  path_behavior        = "none"
  sync_strategy        = "multi-secret"
  update_metadata      = false
  update_resource_tags = "never"
}
