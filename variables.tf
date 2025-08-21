variable "doppler_workspace_id" {
  type        = string
  description = "Doppler workspace ID."
}
variable "doppler_aws_account_id" {
  type        = string
  description = "AWS account ID for Doppler."
  default     = "299900769157"
}
variable "environment" {
  type        = string
  description = "Environment for the deployment."
  default     = "development"
}

variable "kms_key_arns" {
  type        = list(string)
  description = "List of KMS key ARNs to allow access to."
}

variable "project" {
  type        = string
  description = "Project that these resources are supporting."
}

variable "service" {
  type        = string
  description = "Optional service that these resources are supporting. Example: 'api', 'web', 'worker'"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources."
  default     = {}
}
