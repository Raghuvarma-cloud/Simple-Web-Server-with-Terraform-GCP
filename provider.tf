#GCP provider 
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  project     = "my-project-id" #replace with your GCP organisation project ID
  region      = "us-central1"
}
