resource "google_compute_network" "vpc_network" {
  project                 = "mahmoud-348613"
  name                    = "my-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}
