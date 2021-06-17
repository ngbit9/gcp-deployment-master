module "memorystore" {

  source   = "../../../modules/memorystore"
  name = "prod-onclusive-app-us-ct1-memorystore"
  project = var.project

  // Configuration 
  tier = var.tier
  memory_size_gb = var.memory_size_gb
  connect_mode = "DIRECT_PEERING"
  redis_version = var.redis_version
  display_name  = "prod-onclusive-app-us-ct1-memorystore"
  reserved_ip_range = var.reserved_ip_range
  labels = var.labels

  // Networking
  region  = var.region
  location_id = var.location_id
  alternative_location_id = var.alternative_location_id
  authorized_network = var.authorized_network
     
}