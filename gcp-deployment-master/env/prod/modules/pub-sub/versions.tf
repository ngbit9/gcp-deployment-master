terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-pubsub/v2.0.0"
  }

}
