resource "google_cloudbuild_trigger" "trigger" {
  name  = "github-trigger"
  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = "main"
    }
  }

  build {
    steps {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", "us-central1-docker.pkg.dev/${var.project_id}/my-repo/my-image:${var.commit_sha}", "."]
    }
    images = ["us-central1-docker.pkg.dev/${var.project_id}/my-repo/my-image:${var.commit_sha}"]
  }
}
