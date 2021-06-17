variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "region" {
  description = "The Region to deploy all resources"
}

variable "vpc_name" {
  description = "VPC Network to create routes"
}

variable "routes" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}

