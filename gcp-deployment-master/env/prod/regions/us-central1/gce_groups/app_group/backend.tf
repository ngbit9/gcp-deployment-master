terraform {
  backend "gcs" {
    bucket = "prod-my-project-957-311307-tfstate-us-central1-gcs"
    prefix = "prod/regions/us-central1/gce_groups/app_group"
  }
}
