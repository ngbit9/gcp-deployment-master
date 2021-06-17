terraform {
  backend "gcs" {
    bucket = "prod-onclusive-tfstate-us-ct1-bucket"
    prefix = "prod/regions/us-central1/memorystore"
  }
}