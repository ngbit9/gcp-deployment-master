output "load_balancer_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = module.http-load-balancer.load_balancer_ip_address
}