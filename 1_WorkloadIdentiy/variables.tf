variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "service_account_name" {
  description = "Name of the service account"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name in the format 'owner/repo'"
  type        = string
}
