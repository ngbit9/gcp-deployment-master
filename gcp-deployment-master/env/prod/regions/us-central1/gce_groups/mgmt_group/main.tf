###############################################################################################
# Group Name    | Machine Type | Number of VM | Boot Disk Type & Size | Data disk Type & Size #
#-------------------------------------------------------------------------------------------- #
# mgmt-group     | 2 vcpu 4 gb |      2       | pd-standard 30 GB     | pd-standard 50 GB     #
############################################################################################### 

module "disk_policy_creation" {
  source = "../../../../modules/compute_engine/disk_snapshot_policy"

  /* global */
  policy_name      = var.disk_snapshot_policy_name
  utc_time         = "06:00"
  retention_days   = "15"
  storage_location = "us"
}

# Linux Bastion Host

module "mgmt_group_vm01" {
  source = "../../../../modules/compute_engine/linux_vm"

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name        = "prod-projectid-mgmt-bastion-us-ct1-a-01"
  machine_type        = var.machine_type
  machine_zone        = "us-central1-a"
  instance_labels     = var.instance_labels
  vm_deletion_protect = true
  instance_image_selflink = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20200610"

  /* network details */
  network            = var.network
  subnetwork         = var.subnetwork
  network_tags       = ["bastion-host", "mgmt-group"]
  internal_ip        = "10.x.x.x"
  enable_external_ip = true

  /* disk details */
  boot_disk_info       = var.boot_disk0_info["mgmt_vm01"]
  disk_labels          = var.disk_labels
  snapshot_policy_name = module.disk_policy_creation.policy_name

  /* service account */
  service_account = var.service_account

  /*metadata*/
  metadata = {
    ssh-keys       = join("\n", [for user, key in var.ssh_keys : "${user}:${file(key)}"])
    startup-script = file("../../../../resources/scripts/metadata.sh")
  }

}

# Windows Bastion Host

module "mgmt_group_vm02" {
  source = "../../../../modules/compute_engine/windows_vm"

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name        = "prod-projectid-mgmt-bastion-us-ct1-a-02"
  machine_type        = var.machine_type
  machine_zone        = "us-central1-a"
  instance_labels     = var.instance_labels
  vm_deletion_protect = true
  instance_image_selflink = "projects/windows-cloud/global/images/windows-server-2016-dc-v20200609"

  /* network details */
  network            = var.network
  subnetwork         = var.subnetwork
  network_tags       = ["bastion-host", "mgmt-group"]
  internal_ip        = "10.x.x.x"
  enable_external_ip = true

  /* disk details */
  boot_disk_info       = var.boot_disk0_info["mgmt_vm02"]
  disk_labels          = var.disk_labels
  snapshot_policy_name = module.disk_policy_creation.policy_name

  /* service account */
  service_account = var.service_account
}

# Attach data-disk-01 for mgmt_group_vm02

module "mgmt_group_vm02_attach_disk01" {
  source = "../../../../modules/compute_engine/attach_data_disk"

  compute_instance_id  = module.mgmt_group_vm02.compute_instance_id
  machine_zone         = module.mgmt_group_vm02.machine_zone
  data_disk_info       = var.data_disk_mgmt_vm02_info["disk01"]
  disk_labels          = var.disk_labels
  snapshot_policy_name = module.disk_policy_creation.policy_name
}
