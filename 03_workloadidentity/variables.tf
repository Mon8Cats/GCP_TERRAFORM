# variables.tf

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region_name" {
  description = "The GCP region name"
  type        = string
}

variable "member_id" {
  description = "The account to which the role will be assigned"
  type = string

}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "commit_sha" {
  description = "Commit SHA for the image tag"
  type        = string
}