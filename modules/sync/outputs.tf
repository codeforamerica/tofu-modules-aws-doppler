output "integration_id" {
  description = "ID of the Doppler Secrets Manager integration."
  value       = doppler_integration_aws_secrets_manager.this.id
}

output "sync_id" {
  description = "ID of the Doppler sync configuration."
  value       = doppler_secrets_sync_aws_secrets_manager.this.id
}
