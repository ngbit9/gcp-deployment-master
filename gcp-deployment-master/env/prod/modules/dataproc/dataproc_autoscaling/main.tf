resource "google_dataproc_autoscaling_policy" "dp_asp" {
  policy_id = var.policy_name
  project   = var.project_id
  location  = var.region

  worker_config {
    max_instances = var.worker_max_instances
  }

  secondary_worker_config {
    max_instances = var.preemptible_max_instances
  }

  basic_algorithm {
    yarn_config {
      graceful_decommission_timeout = var.graceful_decommission_timeout
      scale_up_factor   = var.scale_up_factor
      scale_down_factor = var.scale_down_factor
    }
  }
}