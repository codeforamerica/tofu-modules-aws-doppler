resource "aws_iam_policy" "this" {
  name        = local.name
  description = "Policy to allow Doppler to access secrets in AWS Secrets Manager."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowSecretsAccess"
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:PutSecretValue",
          "secretsmanager:CreateSecret",
          "secretsmanager:DeleteSecret",
          "secretsmanager:TagResource",
          "secretsmanager:UpdateSecret"
        ]
        Resource = "*"
      },
      {
        Sid    = "AllowKMSAccess"
        Effect = "Allow"
        Action = [
          "kms:DescribeKey",
          "kms:ListAliases",
          "kms:ListKeys",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*"
        ]
        Resource = var.kms_key_arns
      },
    ]
  })

  tags = var.tags
}

resource "aws_iam_role" "this" {
  name = local.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          AWS = "arn:aws:iam::${var.doppler_aws_account_id}:root"
        },
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.doppler_workspace_id
          }
        }
      },
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachments_exclusive" "this" {
  role_name   = aws_iam_role.this.name
  policy_arns = [aws_iam_policy.this.arn]
}

module "sync" {
  source = "../modules/sync"

  for_each = var.create_sync ? toset(["this"]) : toset([])

  doppler_project  = var.doppler_project
  environment      = var.environment
  environment_slug = var.doppler_environment_slug
  iam_role_arn     = aws_iam_role.this.arn
  project          = var.project
  service          = var.service
}
