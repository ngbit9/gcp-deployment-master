/******************************************
	VPN gcp to on-prem
 *****************************************/
 module "vpn_ha" {
  source                = "../../../modules/networking/vpn"
  project_id            = var.project_id
  region                = var.region
  network               = var.vpc_name
  name                  = var.vpn_name
  peer_external_gateway = {
      redundancy_type   = "SINGLE_IP_INTERNALLY_REDUNDANT"
      interfaces = [{
          id         = 0
          ip_address = var.on_prem_router_ip # on-prem router ip address
      }]
  }
  router_asn    = 64514
  tunnels       = {
    remote-0    = {
      bgp_peer  = {
        address = "169.254.1.1"
        asn     = 64513
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = 0
      shared_secret                   = var.secret_key_phrase0
    }
    remote-1    = {
      bgp_peer  = {
        address = "169.254.2.1"
        asn     = 64513
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = 0
      shared_secret                   = var.secret_key_phrase1
    }
  }
}