# Project IAM Service Account Module

This module makes it easy to create custom roles and Perform role bindings for IAM Service Accounts.

- Custom roles
- IAM Service Accounts
- Role bindings for IAM Service Accounts

## Usage
Basic usage of this module is as follows:

* Custom roles

```hcl
module "custom_role" {
  source      = "../../../modules/iam/custom_role/"
  project     = var.project_id
  role_id     = var.custom_role_iap_access["role_name"]
  permissions = var.custom_role_iap_access["permissions"]
}
```

* Service Accounts

```hcl
module "service_account" {
  source                = "../../../modules/iam/service_account_new"
  project_id            = var.project_id
  service_account_name  = var.service_account_app_group["service_account"]
}
```

* IAM members and role bindings

```hcl
module "member_roles" {
  source                      = "../../../modules/iam/member_iam"
  service_account_address     = module.service_account_app_group.email
  project_id                  = var.project_id
  project_roles               = ["projects/${var.project_id}/roles/${var.service_account_app_group["role_name"]}"]
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id   = "example.com"
region       = "us-central1"

service_account_app_group = {
                              service_account = "example-service-account"
                              role_name       = "example-custom-role"
                              permissions = [
                                      "storage.buckets.list",
                                      "storage.buckets.get",
                                  ]
                              }
```

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure