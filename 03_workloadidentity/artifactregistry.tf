resource "google_artifact_registry_repository" "docker_repo" {
  repository_id = "my-repo"
  format        = "DOCKER"
  location      = "us-central1"
}
