variable "policy_name" {
    description = "The name of the cluster autoscaling policy, unique within the project and region"
}

variable "project_id" {
    description = "The project in which the cluster will exist"
}

variable "region" {
    description = "The region in which the cluster and associated nodes will be created in"
}

variable "worker_max_instances" {
    description = "Specifies the number of worker nodes to scale up to"
    default     = 0
}

variable "preemptible_max_instances" {
    description = "Specifies the number of preemptible nodes to scale up to"
    default     = 0
}

variable "graceful_decommission_timeout" {
    description = "Timeout for YARN graceful decommissioning of Node Managers. Specifies the duration to wait for jobs to complete before forcefully removing workers"
    default     = "60s"
}

variable "scale_up_factor" {
    description = "Fraction of average YARN pending memory in the last cooldown period for which to add workers"
    default     = 0.5
}

variable "scale_down_factor" {
    description = "Fraction of average YARN pending memory in the last cooldown period for which to remove workers"
    default     = 0.5
}