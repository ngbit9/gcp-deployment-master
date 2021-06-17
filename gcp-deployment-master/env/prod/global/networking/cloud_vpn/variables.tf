variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "region" {
  description = "Default Region"
}

variable "vpc_name" {
  description = "VPC Network to create routes"
}
variable "vpn_name" {
  description = "The VPN gateway name for GCP to on-prem"
}

variable "on_prem_router_ip" {
  description = "Configuration of an external VPN gateway to which this VPN is connected."
}

variable "secret_key_phrase0" {
  description = "Key phrase for ikev2 secret key for remote 0"
}

variable "secret_key_phrase1" {
  description = "Key phrase for ikev2 secret key for remote 1"
}