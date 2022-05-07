terraform {
  backend "gcs" {
    bucket  = "mahmoud-348613-backet"
    prefix  = "terraform/state"
  }
}