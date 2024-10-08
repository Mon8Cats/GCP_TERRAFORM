resource "google_storage_bucket" "my_bucket" {
  name          = "terraform-on-gcp-gke"
  location      = "US"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}
