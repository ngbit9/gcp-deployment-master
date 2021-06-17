# Project Firewall Rules Module

This module makes it easy to create Firewall Rules for the GCP Network.

## Usage
Basic usage of this module is as follows:

* HA VPN

```hcl
module "fw_rule" {
  source = "../../../modules/networking/firewall"

  network       = var.vpc_name
  name          = "${var.vpc_name}-example-fw"
  protocol      = "tcp"
  ports         = ["8080"]
  source_ranges = ["A.B.C.D/32"]
  source_tags   = ["example-source-tags"]
  target_tags   = ["example-target-tags"]
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