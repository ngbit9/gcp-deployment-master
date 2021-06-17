# Dataproc

<!-- ## Terraform Structure
Overall File structure for regional dataproc section
To provision, edit the terraform.tfvars.sample files within the folders and do a 'terraform init and apply'
```
├── dataproc
|   ├── backend.tf
|   ├── main.tf
|   ├── outputs.tf
|   ├── providers.tf
|   ├── terraform.tfvars.sample
|   ├── variables.tf
|   └── versions.tf
``` -->

<!-- ## Variables -->

Features : 
- Multi-Regional/Regional Cluster
- Backup configuration
- Add additional users

## Usage

Basic usage of this module is as follows:

* Google Dataproc Cluster

```hcl
module "dataproc_cluster" {
  source        = "../../../modules/dataproc/dataproc_cluster"
  cluster_name  = "prod-projectid-dataproc-cluster-1"
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  network       = var.network
  subnetwork    = var.subnetwork
  network_tags  = ["dataproc-cluster"]

  // master_config
  master_num_instances     = 1
  master_machine_type      = "n1-standard-1"
  master_boot_disk_type    = "pd-standard"
  master_boot_disk_size_gb = 20
  master_num_local_ssds    = 0

  // worker_config
  worker_num_instances     = 2
  worker_machine_type      = "n1-standard-1"
  worker_boot_disk_type    = "pd-standard"
  worker_boot_disk_size_gb = 20
  worker_num_local_ssds    = 0

  // preemptible_worker_config
  preemptible_num_instances     = 0
  preemptible_boot_disk_type    = "pd-standard"
  preemptible_boot_disk_size_gb = 20
  preemptible_num_local_ssds    = 0

  // software_config
  image_version = "1.4-ubuntu18"

  // autoscaling policy
  policy_name = module.dataproc_autoscaling_policy.policy_name
}
```


## Usage of tfvars file

Basic usage of this module is as follows:

* Google Dataproc Cluster sample tfvars example

```hcl
project_id              = "prod-projectid"
network                 = "prod-projectid-vpc"
subnetwork              = "prod-projectid-vpc-subnet"
region                  = "us-central1"
zone                    = "us-central1-c"
network_tags            = "prod_dataproc"
```


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
