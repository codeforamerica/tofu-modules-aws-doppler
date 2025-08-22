variable "doppler_project" {
  type        = string
  description = "Doppler project name. If not provided, will be derived from the program, project, and service."
  default     = null
}

variable "environment" {
  type        = string
  description = "Environment for the deployment."
  default     = "development"
}

variable "environment_slug" {
  type        = string
  description = "Doppler environment slug. If not provided, the slug will be derived from the environment."
  default     = null
}

variable "iam_role_arn" {
  type        = string
  description = "ARN of the IAM role that Doppler will assume to access AWS Secrets Manager."
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
  description = "Optional service that these resources are supporting. Example: 'api', 'web', 'worker'"
  default     = null
}
