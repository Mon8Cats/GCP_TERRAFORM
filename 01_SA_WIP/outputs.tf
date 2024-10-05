# outputs.tf

output "workload_identity_provider" {
  description = "Workload Identity Provider for GitHub OIDC."
  value       = google_iam_workload_identity_pool_provider.github_provider.name
}

output "service_account_email" {
  description = "Email of the created service account."
  value       = google_service_account.github_runner.email
}
