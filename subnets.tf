  resource "google_compute_subnetwork" "management" {
  name          = "management"
  ip_cidr_range = "10.0.0.0/24"
  region      = "asia-east1"
  network       = google_compute_network.vpc_network.id
}
resource "google_compute_subnetwork" "restricted" {
  name          = "restricted"
  ip_cidr_range = "10.0.1.0/24"
  region      = "asia-east1"
  network       = google_compute_network.vpc_network.id
}