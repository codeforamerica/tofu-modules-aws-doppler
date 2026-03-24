variable "create_sync" {
  type        = bool
  description = "Whether to create a sync for the Doppler project."
  default     = true
}

variable "doppler_aws_account_id" {
  type        = string
  description = "AWS account ID for Doppler."
  default     = "299900769157"
}

variable "doppler_environment_slug" {
  type        = string
  description = <<EOT
    Doppler environment slug. If not provided, the slug will be derived from the
    environment.
    EOT
  default     = null
}

variable "doppler_project" {
  type        = string
  description = <<EOT
    Doppler project name. If not provided, will be derived from the program,
    project, and service.
    EOT
  default     = null
}

variable "doppler_workspace_id" {
  type        = string
  description = "Doppler workspace ID."
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

variable "program" {
  type        = string
  description = "Program the application belongs to."
  default     = null
}

variable "project" {
  type        = string
  description = "Project that these resources are supporting."
}

variable "service" {
  type        = string
  description = <<EOT
    Optional service that these resources are supporting. Example: 'api', 'web',
    'worker'.
    EOT
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources."
  default     = {}
}
