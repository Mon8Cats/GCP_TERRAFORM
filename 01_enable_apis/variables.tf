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
