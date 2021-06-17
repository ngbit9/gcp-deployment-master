output "cluster_name" {
    description = "Name of the cluster created"
    value = module.dataproc_cluster.cluster_name
}

output "policy_name" {
    description = "List of master instance names which have been assigned to the cluster."
    value = module.dataproc_autoscaling_policy.policy_name
}