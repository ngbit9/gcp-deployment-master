# Terraform GCP Resource Module 

This is a collection of submodules that make it easier to non-destructively manageresources on Google Cloud Platform:

| Name | Description | SelfLink
|------|-------------|------|
| Cloud Storage | The GCP storage modules | [cloud_storage](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/gcs) |
| Cloud SQL | The GCP Cloud SQL modules includes sql and postgre Database type | [cloud_sql](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/regions/us-central1/cloudsql) |
| Compute Engine | The GCP Compute Engine Linux/Windows VM creation module | [compute_engine](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/regions/us-central1/gce_groups) |
| Dataproc Cluster | The GCP Dataproc Cluster module which includes cluster and autoscaling | [dataproc](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/regions/us-central1/dataproc) |
| Google Kubernetes Engine | The GCP Google Kubernetes Engine Cluster module which includes nodepool and provate gke cluster | [google_kubernetes_engine](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/regions/us-central1/gke_cluster) |
| IAM | The GCP IAM modules include creating custom roles, adding roles/permissions to member or service account, generate service account key. | [iam](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/iam) |
| Networking | The GCP Networking modules include creating vpc,subnets,vpn,firewall rules,nat gateways,private service access,routes and private dns zone  | [networking](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/networking) |


