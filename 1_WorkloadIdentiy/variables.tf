# variables.tf

variable "project_id" {
  description = "The GCP project ID where resources will be created."
  type        = string
}

variable "github_account" {
  description = "GitHub account (owner or org name)."
  type        = string
}

variable "github_repo_name" {
  description = "GitHub repository name."
  type        = string
}

# Combine GitHub account and repository into a single variable
variable "github_repo" {
  description = "GitHub repository in the format 'account/repo'."
  type        = string
  default     = "${var.github_account}/${var.github_repo_name}"
}
