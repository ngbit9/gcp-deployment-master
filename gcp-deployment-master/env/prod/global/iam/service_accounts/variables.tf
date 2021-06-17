/******************************************
  service_account variables
 *****************************************/
variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The GCP region of the deployment."
}

variable "service_account_app_group" {
  description = "service Account to add the IAM policies/bindings for app-group"
}

variable "service_account_mgmt_group" {
  description = "service Account to add the IAM policies/bindings for mgmt-group"
}