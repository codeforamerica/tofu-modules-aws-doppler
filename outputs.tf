output "doppler_integration_id" {
  description = "ID of the Doppler Secrets Manager integration."
  value       = var.create_sync ? module.sync["this"].integration_id : null
}

output "doppler_sync_id" {
  description = "ID of the Doppler sync configuration."
  value       = var.create_sync ? module.sync["this"].sync_id : null
}

output "role_arn" {
  description = "ARN of the IAM role to assume for accessing secrets."
  value       = aws_iam_role.this.arn
}
