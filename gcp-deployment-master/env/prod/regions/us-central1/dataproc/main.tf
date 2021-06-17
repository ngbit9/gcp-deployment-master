module "dataproc_autoscaling_policy" {
  source      = "../../../modules/dataproc/dataproc_autoscaling"
  policy_name = "dp-autoscale-policy"
  project_id  = var.project_id
  region      = var.region

  // max instance count
  worker_max_instances      = 2
  preemptible_max_instances = 2

  // yarn_config
  graceful_decommission_timeout = "60s"
  scale_up_factor               = 0.5
  scale_down_factor             = 0.5
}

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
