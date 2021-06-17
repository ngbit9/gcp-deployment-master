# Google Cloud Storage Module

This module makes it easy to create one or more GCS buckets, and assign basic permissions on them to arbitrary users.

- One or more GCS buckets
- Zero or more IAM bindings for those buckets

## Usage

Basic usage of this module is as follows:

* Snapshot policy

```hcl
resource "google_storage_bucket" "bucket" {
  name               = var.name
  project            = var.project_id
  location           = var.location
  storage_class      = var.storage_class
  bucket_policy_only = var.bucket_policy_only
  labels             = var.labels
  force_destroy      = var.force_destroy

  versioning {
    enabled = var.versioning
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [var.retention_policy]
    content {
      is_locked        = var.retention_policy.is_locked
      retention_period = var.retention_policy.retention_period
    }
  }

  dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
      default_kms_key_name = var.encryption.default_kms_key_name
    }
  }
}
```


## Inputs


| Name | Description | Type
|------|-------------|------|
| name | Bucket name suffixes | list(string) |
| project_id | Bucket project id | string |
| location | Bucket location | string |
| storage_class |Bucket storage class | string |
| bucket_policy_only | Disable ad-hoc ACLs on specified buckets. Defaults to true. Map of lowercase unprefixed name => boolean | map |
| labels | Labels to be attached to the buckets | map |
| force_destroy | Optional map of lowercase unprefixed name => boolean, defaults to false | map |
| versioning | Optional map of lowercase unprefixed name => boolean, defaults to false.| map |
| encryption_key_names | Optional map of lowercase unprefixed name => string, empty strings are ignored| map |


## Requirements
- Terraform v0.12
- Service Account
User or service account credentials with the following roles must be used to provision the resources of this module: <br>
Storage Admin: roles/storage.admin


