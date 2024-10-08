# providers.tf
terraform {
  required_version = ">=1.9"
  required_providers {
    google = {
      source = "harshicorp/google"
      version = ">= 5.38.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region_name # "us-central1"  # or any preferred region
}
