
/******************************************
  Module for service_account_app_group
 *****************************************/
module "custom_role_app_group" {
  source                    = "../../../modules/iam/custom_role/"
  project                   = var.project_id
  role_id                   = var.service_account_app_group["role_name"]
  permissions               = var.service_account_app_group["permissions"]
}

module "service_account_app_group" {
  source                = "../../../modules/iam/service_account_new"
  project_id            = var.project_id
  service_account_name  = var.service_account_app_group["service_account"]
}

module "member_roles_app_group" {
  source                      = "../../../modules/iam/member_iam"
  service_account_address     = module.service_account_app_group.email
  project_id                  = var.project_id
  project_roles               = ["projects/${var.project_id}/roles/${var.service_account_app_group["role_name"]}"]
}

/******************************************
  Module service_account_mgmt_group
 *****************************************/

module "custom_role_mgmt_group" {
  source                    = "../../../modules/iam/custom_role/"
  project                   = var.project_id
  role_id                   = var.service_account_mgmt_group["role_name"]
  permissions               = var.service_account_mgmt_group["permissions"]
}

module "service_account_mgmt_group" {
  source                = "../../../modules/iam/service_account_new"
  project_id            = var.project_id
  service_account_name  = var.service_account_mgmt_group["service_account"]
}

module "member_roles_mgmt_group" {
  source                      = "../../../modules/iam/member_iam"
  service_account_address     = module.service_account_mgmt_group.email
  project_id                  = var.project_id
  project_roles               = ["projects/${var.project_id}/roles/${var.service_account_mgmt_group["role_name"]}"]
}

