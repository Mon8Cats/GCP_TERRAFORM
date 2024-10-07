resource "google_iam_workload_identity_pool" "github_pool" {
  provider = google
  project  = var.project_id
  location = "global"
  workload_identity_pool_id = "github-pool"
  display_name = "GitHub Pool"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  provider_id = "github-provider"
  display_name = "GitHub Identity Provider"
  attribute_mapping = {
    "google.subject"         = "assertion.sub"
    "attribute.actor"        = "assertion.actor"
    "attribute.repository"   = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_binding" "github_mapping" {
  service_account_id = google_service_account.ci_service_account.name
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_repo}",
  ]
}
