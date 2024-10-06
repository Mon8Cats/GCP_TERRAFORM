# providers.tf

provider "google" {
  project = var.project_id
  region  = "us-central1"  # or any preferred region
}
