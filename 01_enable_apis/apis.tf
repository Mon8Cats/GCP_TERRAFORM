# Grant the Service Usage Admin role to a specific user
resource "google_project_iam_member" "service_usage_admin" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageAdmin"
  member  = var.member_id
}

# Assign Resource Manager Project IAM Admin role
resource "google_project_iam_member" "project_iam_admin" {
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = var.member_id
}


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
