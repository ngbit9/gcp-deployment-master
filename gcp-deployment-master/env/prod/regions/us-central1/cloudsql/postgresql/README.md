# Google Cloud SQL Postsql Module

This module makes it easy to create a Cloud SQL Postgre instance, with root users.

Features : 
- Multi-Regional/Regional Cluster
- Backup configuration
- Add additional users

## Usage

Basic usage of this module is as follows:

* Google Cloud SQL Postgre

```hcl
module "postgresql" {
  source           = "../../../../modules/cloudsql/postgresql"
  name             = var.instance_name
  project_id       = var.project_id
  database_version = "POSTGRES_11"
  region           = var.region

  // Master configurations
  tier                            = var.instance_type
  zone                            = var.instance_primary_zone
  availability_type               = var.availability_type
  disk_size                       = var.disk_size
  disk_type                       = var.disk_type
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"

  database_flags = var.database_flags

  user_labels = var.user_labels

  ip_configuration = {
    ipv4_enabled    = false
    require_ssl     = true
    private_network = "projects/${var.project_id}/global/networks/${var.vpc_network}"
    authorized_networks = []
  }

  backup_configuration = {
    enabled    = true
    start_time = "20:55"
  }

  user_name     = var.root_user
  user_password = var.root_password

  additional_users = var.additional_users
}

```

## Usage of tfvars file

Basic usage of this module is as follows:

* Google Cloud SQL Postre sample tfvars example

```hcl
project_id              = "prod-projectid"
vpc_network             = "prod-projectid-vpc"
region                  = "us-central1"
instance_name           = "prod-projectid-postgresql-1"
instance_type           = "db-custom-1-3840"
instance_primary_zone   = "c"
availability_type       = "REGIONAL"

database_flags = [
  {
    name  = "autovacuum"
    value = "off"
  },
]

user_labels = {
  owner = "cloud-team"
}

root_user = "root"
root_password = "password"

additional_users = []
```


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
