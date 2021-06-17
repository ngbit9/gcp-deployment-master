# /******************************************
#   Outputs of service_account and role binding for app group
#  *****************************************/

output "custom_role_app_group" {
  value = module.custom_role_app_group.role_name
}

output "app_group_email" {
  value = module.service_account_app_group.email
}

