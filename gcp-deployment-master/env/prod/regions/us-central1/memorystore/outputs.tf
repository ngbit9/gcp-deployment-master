output "memstore_instance_id" {
    value = module.memorystore.id
}

output "instance_ip" {
  value = module.memorystore.host
}
