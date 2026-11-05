resource "aws_iam_policy" "this" {
  name        = local.name
  description = "Policy to allow Doppler to access secrets in AWS Secrets Manager."
  tags        = var.tags

  policy = jsonencode(yamldecode(templatefile("${path.module}/templates/iam-policy.yaml.tftpl", {
    kms_key_arns = var.kms_key_arns
  })))
}

resource "aws_iam_role" "this" {
  depends_on = [aws_iam_policy.this]

  name                  = local.name
  force_detach_policies = true
  tags                  = var.tags

  assume_role_policy = jsonencode(yamldecode(templatefile("${path.module}/templates/trust-policy.yaml.tftpl", {
    doppler_account_id   = var.doppler_aws_account_id
    doppler_workspace_id = var.doppler_workspace_id
  })))
}

resource "aws_iam_role_policy_attachments_exclusive" "this" {
  role_name   = aws_iam_role.this.name
  policy_arns = [aws_iam_policy.this.arn]
}

module "sync" {
  source = "./modules/sync"

  for_each = var.create_sync ? toset(["this"]) : toset([])

  doppler_project  = var.doppler_project
  environment      = var.environment
  environment_slug = var.doppler_environment_slug
  iam_role_arn     = aws_iam_role.this.arn
  program          = var.program
  project          = var.project
  region           = data.aws_region.current.region
  service          = var.service
}
