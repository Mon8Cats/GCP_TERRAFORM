# providers.tf

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket = "terraform-mon8cats"
    prefix = "dev/gke-cluster-public"
  }
}
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region1 # "us-central1"  # or any preferred region
}
