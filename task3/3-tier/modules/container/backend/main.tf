
# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.container_name}"
  image = "${var.image}"

  networks_advanced {
    name    = "database_internal"
    aliases = ["${var.frontend_network_alias}"]
  }
    ports {
    internal = "${var.int_port}"
  }
}