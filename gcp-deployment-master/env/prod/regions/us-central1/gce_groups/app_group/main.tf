###################################################################
# Group Name    | Machine Type | Number of VM | Disk Type & Size  #
#-----------------------------------------------------------------#
# app-group     | 2 vcpu 4 gb  |      1       | pd-ssd 20 gb      #
################################################################### 

module "disk_policy_creation" {
  source = "../../../../modules/compute_engine/disk_snapshot_policy"

  /* global */
  policy_name      = var.disk_snapshot_policy_name
  utc_time         = "06:00"
  retention_days   = "15"
  storage_location = "us"
}

module "app_group_vm1" {
  source = "../../../../modules/compute_engine/linux_vm"

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name            = "prod-projectid-app-us-ct1-a-01"
  machine_type            = var.machine_type
  machine_zone            = "us-central1-a"
  instance_labels         = var.instance_labels
  vm_deletion_protect     = true
  instance_image_selflink = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20200610"


  /* network details */
  network            = var.network
  subnetwork         = var.subnetwork
  network_tags       = var.network_tags
  internal_ip        = "10.1.1.16"
  enable_external_ip = false

  /* disk details */
  boot_disk_info       = var.boot_disk0_info["app_vm01"]
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

module "app_group_vm2" {
  source = "../../../../modules/compute_engine/linux_vm"

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name            = "prod-projectid-app-us-ct1-b-02"
  machine_type            = var.machine_type
  machine_zone            = "us-central1-b"
  instance_labels         = var.instance_labels
  vm_deletion_protect     = true
  instance_image_selflink = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20200610"


  /* network details */
  network            = var.network
  subnetwork         = var.subnetwork
  network_tags       = var.network_tags
  internal_ip        = "10.1.2.8"
  enable_external_ip = false

  /* disk details */
  boot_disk_info       = var.boot_disk0_info["app_vm02"]
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

module "stackdriver_alerts_vm1" {
  source = "../../../../modules/stackdriver-alerting"

  instance_name                     = module.app_group_vm1.name
  display_name                      = "${module.app_group_vm1.name}-alert-policy"
  enabled                           = "false"
  duration                          = "300s"
  cpu_threshold_value               = "0.8"
  memory_threshold_value            = "80"
  disk_threshold_value              = "80"
  violation_count                   = "1"
  notification_channel_display_name = "Compute-Resource-Utilization-Alert-Channel"
  channel_type                      = "email"
  email_address                     = var.alert_policy_email_address
}

module "stackdriver_alerts_vm2" {
  source = "../../../../modules/stackdriver-alerting"

  instance_name                     = module.app_group_vm2.name
  display_name                      = "${module.app_group_vm2.name}-alert-policy"
  enabled                           = "false"
  duration                          = "300s"
  cpu_threshold_value               = "0.8"
  memory_threshold_value            = "80"
  disk_threshold_value              = "80"
  violation_count                   = "1"
  notification_channel_display_name = "Compute-Resource-Utilization-Alert-Channel"
  channel_type                      = "email"
  email_address                     = var.alert_policy_email_address
}
