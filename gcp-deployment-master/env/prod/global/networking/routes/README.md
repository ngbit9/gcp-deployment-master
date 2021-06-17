# Project Custom Routes Module

This module makes it easy to create Custom Routes for the GCP Network.

- Custom Routes

## Usage
Basic usage of this module is as follows:

* Custom Routes

```hcl
module "routes" {
  source                                 = "../../../modules/networking/routes"
  project_id                             = var.project_id
  network_name                           = var.vpc_name
  routes                                 = var.routes
  delete_default_internet_gateway_routes = false
}

```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id   = "example.com"
region       = "us-central1"
vpc_name     = "example-vpc"
```

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure