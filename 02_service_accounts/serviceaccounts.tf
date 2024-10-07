
resource "google_service_account" "ci_service_account" {
  account_id   = "ci-service-account"
  display_name = "CI Service Account"
}

resource "google_project_iam_binding" "artifact_registry_permissions" {
  role    = "roles/artifactregistry.admin"
  members = ["serviceAccount:${google_service_account.ci_service_account.email}"]
}

resource "google_project_iam_binding" "cloud_build_permissions" {
  role    = "roles/cloudbuild.builds.editor"
  members = ["serviceAccount:${google_service_account.ci_service_account.email}"]
}

resource "google_project_iam_binding" "cloud_run_permissions" {
  role    = "roles/run.admin"
  members = ["serviceAccount:${google_service_account.ci_service_account.email}"]
}

resource "google_project_iam_binding" "cloud_functions_permissions" {
  role    = "roles/cloudfunctions.admin"
  members = ["serviceAccount:${google_service_account.ci_service_account.email}"]
}

resource "google_project_iam_binding" "cloud_storage_permissions" {
  role    = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.ci_service_account.email}"]
}
