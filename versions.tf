terraform {
  required_version = ">= 1.9.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.4.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.4.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
}
