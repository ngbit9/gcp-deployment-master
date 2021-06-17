terraform {
  backend "gcs" {
    bucket = "prod-project_id-tfstate-region-gcs"
    prefix = "prod/regions/us-central1/gce_groups/mgmt_group"
  }
}
