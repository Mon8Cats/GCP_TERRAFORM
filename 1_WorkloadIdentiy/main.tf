provider "google" {
  project = var.project_id
  region  = "us-central1"  # Change as needed
}

resource "google_service_account" "gcp_sa" {
  account_id   = var.service_account_name
  display_name = "GCP Service Account for GitHub Actions"
}

resource "google_project_iam_member" "build_permissions" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.editor"
  member  = "serviceAccount:${google_service_account.gcp_sa.email}"
}

resource "google_project_iam_member" "artifact_registry_permissions" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.gcp_sa.email}"
}

resource "google_project_iam_member" "cloud_run_permissions" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.gcp_sa.email}"
}

resource "google_project_iam_member" "cloud_function_permissions" {
  project = var.project_id
  role    = "roles/cloudfunctions.admin"
  member  = "serviceAccount:${google_service_account.gcp_sa.email}"
}

resource "google_project_iam_member" "gke_permissions" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.gcp_sa.email}"
}

resource "google_iam_workload_identity_pool" "github_actions_pool" {
  workload_identity_pool_id = "${var.service_account_name}-pool"
  display_name              = "GitHub Actions Workload Identity Pool"
  description               = "Workload Identity Pool for GitHub Actions"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id = google_iam_workload_identity_pool.github_actions_pool.workload_identity_pool_id
  provider_id               = "github-actions"
  display_name              = "GitHub Actions Provider"
  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }
  
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_project_iam_member" "github_workload_identity_user" {
  project = var.project_id
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${google_service_account.gcp_sa.email}"
}
