/******************************************
	Routes
 *****************************************/
module "routes" {
  source                                 = "../../../modules/networking/routes"
  project_id                             = var.project_id
  network_name                           = var.vpc_name
  routes                                 = var.routes
  delete_default_internet_gateway_routes = false
}
