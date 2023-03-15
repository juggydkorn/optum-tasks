
# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.container_name}"
  image = "${var.image}"

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}"
  ]
  networks_advanced {
    name    = "database_internal"
    aliases = ["${var.database_network_alias}"]
  }
    ports {
    internal = "${var.int_port}"
  }

}