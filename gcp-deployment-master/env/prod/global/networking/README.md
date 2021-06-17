# Network Terraform Module

This is a collection of submodules that make it easier to non-destructively manage multiple Network resources on Google Cloud Platform:

| Name | Description | SelfLink
|------|-------------|------|
| Cloud VPN | The GCP HA VPN from GCP network to On-prem | [cloud_vpn](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/networking/cloud_vpn) |
| VPC Network | The GCP network and subnetwork | [vpc_subnets](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/networking/vpc_subnets) |
| Firewall Rules | The Firewall rules for the GCP network | [firewall_rules](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/networking/firewall_rules) |
| Cloud NAT | The NAT gateway for the GCP network | [nat_gateway](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/networking/nat_gateway) |
| Routes | The custom routes for the GCP network | [routes](https://gitlab.com/SearceLearning/gcp-terraform-skeleton/-/tree/master/env/prod/global/networking/routes) |
