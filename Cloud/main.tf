terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = "./keys/terra.....json"
  project = "terraform-runner-412408"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "terra...."
  location      = "US"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}