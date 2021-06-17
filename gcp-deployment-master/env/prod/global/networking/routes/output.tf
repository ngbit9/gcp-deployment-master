output "route_names" {
  value       = [for route in module.routes.routes : route.name]
  description = "The route names associated with this VPC"
}