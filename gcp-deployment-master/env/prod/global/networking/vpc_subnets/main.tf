/******************************************
	VPC configuration
 *****************************************/
module "vpc" {
  source                  = "../../../modules/networking/vpc"
  project_id              = var.project_id
  network_name            = var.vpc_name
  routing_mode            = var.routing_mode
  description             = var.description
  shared_vpc_host         = false
  auto_create_subnetworks = false
}

/******************************************
	Subnet configuration
 *****************************************/
module "subnets" {
  source                  = "../../../modules/networking/subnets"
  project_id              = var.project_id
  network_name            = module.vpc.network_name
  subnets                 = var.subnets
}