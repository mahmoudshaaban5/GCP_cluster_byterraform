resource "google_compute_firewall" "rules" {
  project     = "mahmoud-348613"
  name        = "my-firewall-rule"
  network     = google_compute_network.vpc_network.id


  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}