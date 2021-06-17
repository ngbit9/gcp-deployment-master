# Google Compute Engine Module

This module makes it easy to create a Google Compute Engine (Virtual Machines)

- Google Compute Instance
- Static IP addresses
- Disks
- Snapshot policy

Features:

- Static Internal address of choice 
- Static External addresss
- VM deletion protection
- Custom GCE disks
- Snapshot policy for GCE disks
- Custom Service Accounts
- Bootstrap scripts
- SSH access configuration
- GCE custom machines

## Usage

Basic usage of this module is as follows:

* Snapshot policy

```hcl
module "disk_policy_creation" {
  source = "../../../../modules/compute_engine/disk_snapshot_policy"

  /* global */
  policy_name      = var.disk_snapshot_policy_name
  utc_time         = "06:00"
  retention_days   = "15"
  storage_location = "us"
}
```

* Google Compute Engine

```hcl
module "google_compute_engine" {
  source = "../../../../modules/compute_engine/windows_vm"

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name        = "example-gce"
  machine_type        = var.machine_type
  machine_zone        = "us-central1-a"
  instance_labels     = var.instance_labels
  vm_deletion_protect = true // VM deletion protection can be enabled by passing the true/false flag.
  instance_image_selflink = "projects/windows-cloud/global/images/windows-server-2016-dc-vanything"

  /* network details */
  network            = var.network // The VPC network.
  subnetwork         = var.subnetwork // The VPC subnetwork/subnet
  network_tags       = var.network_tags // The network tags for firewalls rules.
  internal_ip        = "A.B.C.D" // Pass the internal IP of your choice.
  enable_external_ip = true // You can have external IP by passing the true/false flag.

  /* disk details */
  boot_disk_info = var.boot_disk0_info["example_vm"] // Boot disk data for the GCE instance.
  disk_labels    = var.disk_labels

  /* snapshot policy */
  snapshot_policy_name = module.disk_policy_creation.policy_name // It is passed from snapshot policy module to have explicit dependency

  /* service account */
  service_account = var.service_account // To have custom service account and api scopes
}
```

* GCE disks

To attach additional data disks to Google Compute Engine (VM) we are dynamically passing the instance ID and Zone from Google compute resource to Disk resources to have explicit dependency. Similarly for snapshot policy name we are passing the Snapshot policy name from Snapshot policy resource.

```hcl
module "gce_attach_disk01" {
  source = "../../../../modules/compute_engine/attach_data_disk"

  compute_instance_id  = module.google_compute_engine.compute_instance_id
  machine_zone         = module.google_compute_engine.machine_zone
  data_disk_info       = var.data_disk_example_info["disk01"]
  disk_labels          = var.disk_labels
  snapshot_policy_name = module.disk_policy_creation.policy_name
}
```

```hcl
data_disk_example_info = {
  disk01 = {
    disk_name    = "example-data01-disk"
    disk_size_gb = 100
    disk_type    = "pd-ssd"
  }
}
```

To add multiple data disks you need to follow same steps to create new disk resources and attach the disks to VM.

```hcl
module "gce_attach_disk02" {
  source = "../../../../modules/compute_engine/attach_data_disk"

  compute_instance_id  = module.google_compute_engine.compute_instance_id
  machine_zone         = module.google_compute_engine.machine_zone
  data_disk_info       = var.data_disk_example_info["disk02"]
  disk_labels          = var.disk_labels
  snapshot_policy_name = module.disk_policy_creation.policy_name
}
```

```hcl
data_disk_example_info = {
  disk01 = {
    disk_name    = "example-data01-disk"
    disk_size_gb = 100
    disk_type    = "pd-ssd"
  },
  disk02 = {
    disk_name    = "example-data02-disk"
    disk_size_gb = 100
    disk_type    = "pd-standard"
  }
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
project_id = "gcp-project-name"
region     = "us-central1"

machine_type = "custom-2-4096"

network      = "example-vpc"
subnetwork   = "example-subnet"
network_tags = ["example-group"]

disk_snapshot_policy_name = "example-disksnapshot-policy"

boot_disk0_info = {
  haproxy_vm01 = {
    disk_size_gb = 20
    disk_type    = "pd-ssd"
  }
}

data_disk_example_info = {
  disk01 = {
    disk_name    = "example-data01-disk"
    disk_size_gb = 100
    disk_type    = "pd-ssd"
  }
}

instance_labels = {
  env        = "example"
  group_name = "example-group"
  owner      = "example"
  team       = "example-team"
}

disk_labels = {
  env        = "example"
  group_name = "example-group"
}

service_account = {
  email  = "example-sa@example-com.gserviceaccount.com"
  scopes = ["cloud-platform"]
}
```

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
