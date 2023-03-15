#Output the IP Address of the Container
output "frontend_ip" {
  value = module.frontend_container.ip
}
output "frontend_container_name" {
  value = module.frontend_container.container_name
}

output "backend_ip" {
  value = module.backend_container.ip
}
output "backend_container_name" {
  value = module.backend_container.container_name
}

output "database_ip" {
  value = module.database_container.ip
}
output "database_container_name" {
  value = module.database_container.container_name
}