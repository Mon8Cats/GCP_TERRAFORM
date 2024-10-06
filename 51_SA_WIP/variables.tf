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

# Combine GitHub account and repository using the format() function
variable "github_repo" {
  description = "GitHub repository in the format 'account/repo'."
  type        = string
  default     = format("%s/%s", var.github_account, var.github_repo_name)
}

#default     = var.github_account .. "/" .. var.github_repo_name