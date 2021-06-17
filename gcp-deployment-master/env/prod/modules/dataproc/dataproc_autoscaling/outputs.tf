output "policy_name" {
    description = "List of master instance names which have been assigned to the cluster."
    value = google_dataproc_autoscaling_policy.dp_asp.name
}