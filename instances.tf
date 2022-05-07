resource "google_compute_instance" "private-instance"{
  name         = "private-instance"
  machine_type = "f1-micro"
  zone         = "asia-east1-a"

  tags = ["management-vm"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name 
    subnetwork = google_compute_subnetwork.management.id
  }
  
  service_account {
    email  = google_service_account.cluster-service-account.email
    scopes = ["cloud-platform"]
  }

}
