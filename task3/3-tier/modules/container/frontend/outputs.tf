#Output the IP Address of the Container
output "ip" {
  value = "${docker_container.container_id.name}"
}

output "container_name" {
  value = "${docker_container.container_id.name}"
}