#Output the IP Address of the Container
output "ip" {
  value = "${docker_container.container_id.id}"
}

output "container_name" {
  value = "${docker_container.container_id.name}"
}