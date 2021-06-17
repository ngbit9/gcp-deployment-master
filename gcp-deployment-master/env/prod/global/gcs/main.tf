/******************************************
	GCS Bucket configuration for Terraform State management
 *****************************************/
module "gcs" {
  source            = "../../modules/cloud_storage"
  project_id        = var.project_id
  location          = var.region
  name              = "prod-my-project-957-311307-tfstate-us-central1-gcs"
}