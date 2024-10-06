# providers.tf

provider "google" {
  project = var.project_id
  region  = var.region_name # "us-central1"  # or any preferred region
}
