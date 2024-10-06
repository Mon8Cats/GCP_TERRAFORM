# main.tf

# Enable necessary Google APIs
resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
}

resource "google_project_service" "iamcredentials" {
  project = var.project_id
  service = "iamcredentials.googleapis.com"
}

resource "google_project_service" "sts" {
  project = var.project_id
  service = "sts.googleapis.com"
}

# Create Google Cloud Service Account
resource "google_service_account" "github_runner" {
  account_id   = "github-runner-sa"
  display_name = "GitHub Runner Service Account"
  project      = var.project_id
}

# Create Workload Identity Pool
resource "google_iam_workload_identity_pool" "github_pool" {
  provider_id   = "github-pool"
  display_name  = "GitHub Pool"
  project       = var.project_id
  workload_identity_pool_id = "github-pool"
}

# Create Workload Identity Provider
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  provider_id             = "github-provider"
  workload_identity_pool_id = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  display_name            = "GitHub Provider"
  project                 = var.project_id

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  attribute_mapping = {
    "google.subject"          = "assertion.sub"
    "attribute.actor"         = "assertion.actor"
    "attribute.repository"    = "assertion.repository"
  }
}

# Bind GitHub repository to Service Account via Workload Identity
resource "google_service_account_iam_member" "sa_binding" {
  service_account_id = google_service_account.github_runner.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_id}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_pool.workload_identity_pool_id}/attribute.repository/${var.github_repo}"
}
