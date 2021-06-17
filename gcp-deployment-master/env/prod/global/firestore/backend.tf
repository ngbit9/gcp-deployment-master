terraform {
  backend "gcs" {
    bucket = "prod-my-project-957-311307-tfstate-us-central1-gcs"
    prefix = "prod/global/networking/cloud_lb/http_lb"
  }
}
