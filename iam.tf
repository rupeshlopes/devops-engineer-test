
# The code below will create a new service account with a invoker role to invoke Cloud Run.
resource "google_service_account" "sa-cloudrun" {
  account_id = "sa-cloudrun"
  display_name = "SA"
}

resource "google_project_iam_member" "cloudrun_owner_binding" {
  project = "integral-genius-266314"
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.sa-cloudrun.email}"
}