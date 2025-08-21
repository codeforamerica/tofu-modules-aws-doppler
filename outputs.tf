output "role_arn" {
  description = "ARN of the IAM role to assume for accessing secrets."
  value       = aws_iam_role.this.arn
}
