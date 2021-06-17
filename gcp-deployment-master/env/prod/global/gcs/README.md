# Google Cloud Storage Module 1

This module makes it easy to create a GCS bucket, and assign basic permissions on it to arbitrary users.

- One GCS bucket
- Zero or more IAM bindings for that bucket

Features:

- Multi-Regional/Regional Bucket
- Bucket storage class
- Bucket versioning

## Usage

Basic usage of this module is as follows:

* GCS Bucket

```hcl
module "bucket" {
  source  = "../../modules/cloud_storage"
  name       = "example-bucket"
  project_id = "example-project"
  location   = "us-east1"
  iam_members = [{
    role   = "roles/storage.viewer"
    member = "user:example-user@example.com"
  }]
}
```

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure