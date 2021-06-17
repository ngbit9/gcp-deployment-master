# Google Compute Engine Attach Disk


This module makes it easy to create one or more Compute Engine Disk's and attach those disk to the compute instance.


## Usage

Basic usage of this module is as follows:


```hcl
resource "google_compute_disk" "gce_disk" {
  name = var.data_disk_info["disk_name"]
  size = var.data_disk_info["disk_size_gb"]
  type = var.data_disk_info["disk_type"]
  zone = var.machine_zone

  labels = merge(
    var.disk_labels,
    map(
      "type", "data",
    )
  )
  physical_block_size_bytes = 4096
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_compute_attached_disk" "gce_disk_attach" {
  disk     = google_compute_disk.gce_disk.id
  instance = var.compute_instance_id
}



```


## Inputs


| Name | Description | Type
|------|-------------|------|
| name | The name of the Disk | string |
| size | Size of the disk in gb | string |
| type | Ddisk type, can be either pd-ssd, local-ssd, or pd-standard | string |
| zone | Primary Zone of the disk | string |
| disk_labels | Key-value map of labels to assign to the disk | map |
| physical_block_size_bytes | Physical block size of the disk in bytes | string |
| prevent_destroy | Prevent disk from destroy | string |
| compute_instance_id | Compute instance id on which disk will be attached | string |


## Requirements
- Terraform v0.12
- Service Account
User or service account credentials with the following roles must be used to provision the resources of this module: <br>
Storage Admin: roles/compute.storageAdmin



