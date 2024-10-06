resource "google_project_service" "enabled_services" {
  for_each = toset([
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudrun.googleapis.com",
    "storage.googleapis.com"
  ])
  project = var.project_id
  service = each.key
}
