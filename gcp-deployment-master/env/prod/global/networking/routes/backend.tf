// file: backend.tf

terraform {
  backend "gcs" {
    bucket = "prod-my-project-957-311307-tfstate-us-central1-gcs"
    prefix = "prod/global/networking/routes"
  }
}
