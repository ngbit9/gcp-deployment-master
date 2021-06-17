
# /******************************************
#   Module for IAP tunneling access for all VMs
#  *****************************************/
module "google_iap_access_fw_rule" {
  source = "../../../modules/networking/firewall"

  network       = var.vpc_name
  name          = "${var.vpc_name}-allow-iap-access-fw"
  protocol      = "tcp"
  ports         = []
  source_ranges = ["35.235.240.0/20"] # Google IAP access range, do not modify
  source_tags   = []
  target_tags   = [] # Rule applies to all instances in the network
}