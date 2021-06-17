# Project Network and Subnetwork Module

This module makes it easy to create Network and Subnetwork for the GCP Network.

- Network (Virtual Private Cloud)
- Subnetwork (Subnets)

## Usage
Basic usage of this module is as follows:

* Network

```hcl
module "vpc" {
  source                  = "../../../modules/networking/vpc"
  project_id              = var.project_id
  network_name            = var.vpc_name
  routing_mode            = var.routing_mode
  description             = var.description
  shared_vpc_host         = false
  auto_create_subnetworks = false
}
```

* Subnetwork

```hcl
module "subnets" {
  source                  = "../../../modules/networking/subnets"
  project_id              = var.project_id
  network_name            = module.vpc.network_name
  subnets                 = var.subnets
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id   = "example.com"
region       = "us-central1"
vpc_name     = "example-vpc"
subnets = [
  {
    subnet_name           = "example-subnet0"
    subnet_ip             = "10.1.0.0/16"
    subnet_region         = "us-central1"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  },
  {
    subnet_name           = "example-subnet1"
    subnet_ip             = "10.2.0.0/16"
    subnet_region         = "us-central1"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  }
]
```

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
