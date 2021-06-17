variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "region" {
  description = "The Region to deploy all resources"
}

variable "vpc_name" {
  description = "The VPC name to be created"
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = "This VPC network will be used for Prod Project"
}