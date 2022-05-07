resource "google_service_account" "cluster-service-account" {
  account_id = "cluster-service-account"
  display_name = "cluster_service_account"
}

resource "google_project_iam_member" "admin_binding" {
  project = "mahmoud-348613"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.cluster-service-account.email}"
}


resource "google_service_account" "node-service-account" {
  account_id = "node-service-account"
  display_name = "node_service_account"
}

resource "google_project_iam_member" "node_binding" {
  project = "mahmoud-348613"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.node-service-account.email}"
}
