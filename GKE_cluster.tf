resource "google_container_cluster" "GKE_cluster" {
  name     = "my-gke-cluster"
  location = "asia-east1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc_network.self_link
  subnetwork               = google_compute_subnetwork.restricted.self_link

  node_locations = [
    "asia-east1-a"
  ]
    master_authorized_networks_config {
        
        cidr_blocks{
            cidr_block = google_compute_subnetwork.management.ip_cidr_range
            display_name = "Managment"
        }

    }
    ip_allocation_policy {
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "192.168.1.0/28"
  }
}

resource "google_container_node_pool" "nodePool" {
  name       = "my-node-pool"
  location   = "asia-east1"
  cluster    = google_container_cluster.GKE_cluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-small"

    service_account = google_service_account.node-service-account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}