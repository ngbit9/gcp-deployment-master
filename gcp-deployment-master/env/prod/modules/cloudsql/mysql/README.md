# Google Cloud-sql for MySQL

This module makes it easy to create one or more Cloud-sql instance with database type MySQL, and assign basic permissions to user, add database, allow autorized ip.


## Usage

Basic usage of this module is as follows:


```hcl
resource "google_sql_database_instance" "default" {
  provider            = google-beta
  project             = var.project_id
  name                = var.name
  database_version    = var.database_version
  region              = var.region
  encryption_key_name = var.encryption_key_name

  settings {
    tier                        = var.tier
    activation_policy           = var.activation_policy
    availability_type           = var.availability_type
    authorized_gae_applications = var.authorized_gae_applications
    dynamic "backup_configuration" {
      for_each = [var.backup_configuration]
      content {
        binary_log_enabled = local.binary_log_enabled
        enabled            = local.backups_enabled
        start_time         = lookup(backup_configuration.value, "start_time", null)
      }
    }
```


## Inputs


| Name | Description | Type
|------|-------------|------|
| name | The name of the Cloud SQL resources | string |
| project_id | Bucket project id | string |
| database_version | The database version to use | string |
| region |The region of the Cloud SQL resources | string |
| encryption_key_name | The full path to the encryption key used for the CMEK disk encryption | string |
| tier | The tier for the master instance. | string |
| activation_policy | The activation policy for the master instance. Can be either ALWAYS, NEVER or ON_DEMAND. | string |
| availability_type | The availability type for the master instance. Can be either REGIONAL or null. | string |
| backup_configuration | The backup_configuration settings subblock for the database setings | object |


## Requirements
- Terraform v0.12
- Service Account
User or service account credentials with the following roles must be used to provision the resources of this module: <br>
CloudSQL Admin: roles/cloudsql.admin


