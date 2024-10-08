# variables.tf

variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
}

variable "gcp_region1" {
  description = "The GCP region name"
  type        = string
}

variable "environment" {
  description = "Environment variable used as a prefix"
  type = string
  default = "dev"  
}

variable "business_division" {
  description = "Business Division"
  type = string
  default = "AppDev"
  
}