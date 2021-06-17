# Google Cloud Project Terraform Modules 1

## Requirements
### Installed Software
- [Terraform](https://www.terraform.io/downloads.html)
- [gcloud](https://cloud.google.com/sdk/gcloud/)

### Configure and Authentication a Service Account
In order to execute this module you must have a Service Account with the following roles:

- Compute Network Admin
- Role Administrator
- Service Account Admin
- Service Account User
- Project IAM Admin
- Storage Admin 

Generate a Service Account Key:

```gcloud iam service-accounts keys create [FILE_NAME].json --iam-account [NAME]@[PROJECT_ID].iam.gserviceaccount.com```

Setting the environment variable:

```export GOOGLE_APPLICATION_CREDENTIALS="[PATH]"```

## This is a collection of submodules that make it easier to create and manage Google Cloud Platform services:

| Name | Description | SelfLink
|------|-------------|------|
| IAM | The Google Cloud Project IAM resources | [iam](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/modules/iam) |
| GCS | The Google Cloud Project GCS resources | [gcs](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/modules/cloud_storage) |
| Network | The Google Cloud Project networking resources | [network](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/modules/networking) |
| Compute Engine | The Google Compute Engine resources | [compute](https://gitlab.com/projectid/gcp-terraform-projectid/-/tree/master/env/prod/regions/us-central1) |

## Features

- Modularized structure.
- Terraform backend state maintained in GCS bucket with versioning enabled.
- Isolation between the terraform tfstate files for the GCP resources for reducing impact.
- Terraform tfvars used for passing varibales
- Consistent structure and naming convention

## Backend configuration

If you are working on a team, then it's best to store the Terraform state file remotely so that many people can access it. In order to set up Terraform to store state remotely, you need two things: an GCS bucket to store the state file in and a Terraform GCS backend resource.

```hcl
terraform {
  backend "gcs" {
    bucket = "example-gcs"
    prefix = "<path-of-the-terraform-files>" // e.g "prod/global/iam/service_accounts"
  }
}
```

## The Terraform resources will consists of following structure

```
├── README.md                 // Description of the module and what it should be used for.
├── main.tf                   // The primary entrypoint for terraform resources.
├── variables.tf              // It contain the declarations for variables.
├── outputs.tf                // It contain the declarations for outputs.
├── providers.tf              // To specify infrastructure vendors.
├── versions.tf               // To specify terraform versions.
├── backend.tf                // To create terraform backend state configuration.
├── terraform.tfvars.sample   // The file to pass the terraform variables values.
```
