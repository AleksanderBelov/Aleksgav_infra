terraform {
  backend "gcs" {
    bucket = "tf-reddit-state"
    prefix = "terraform/state"
  }
}
