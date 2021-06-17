# Google Compute Engine Snapshot Policy


This module makes it easy to Snapshot policy for vm, which will take snapshot of vm according to start time, also we can set max retention time and storage location for the snapshot 


## Usage

Basic usage of this module is as follows:


```hcl
resource "google_compute_resource_policy" "snapshot_policy" {
  name = var.policy_name
  snapshot_schedule_policy {
    schedule {
      hourly_schedule {
        hours_in_cycle = 23
        start_time     = var.utc_time # In UTC
      }
    }
    retention_policy {
      max_retention_days    = var.retention_days
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
      storage_locations = [var.storage_location]
    }
  }
}
```


## Inputs


| Name | Description | Type
|------|-------------|------|
| policy_name | The name of the snapshot policy | string |
| start_time  | Time within the window to start the operations. It must be in an hourly format "HH:MM", where HH : [00-23] and MM : [00] GMT. eg: 21:00 | string |
| hours_in_cycle | The number of hours between snapshots. | string |
| max_retention_days | Maximum age of the snapshot that is allowed to be kept | string |
| on_source_disk_delete | Specifies the behavior to apply to scheduled snapshots when the source disk is deleted. Default value: KEEP_AUTO_SNAPSHOTS Possible values are: * KEEP_AUTO_SNAPSHOTS * APPLY_RETENTION_POLICY | string |
| storage_locations |  Cloud Storage bucket location to store the auto snapshot (regional or multi-regional)| string |



## Requirements
- Terraform v0.12
- Service Account
User or service account credentials with the following roles must be used to provision the resources of this module: <br>
Storage Admin: roles/storage.admin





