# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.container_name}"
  image = "${var.image}"


  env = [
    "database__client=mysql",
    "database__connection__host=${var.database_network_alias}",
    "database__connection__user=${var.frontend_db_username}",
    "database__connection__password=${var.mysql_root_password}",
    "database__connection__database=${var.frontend_db_name}"
  ]
  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
  
  networks_advanced {
    name    = docker_network.public_bridge_network.name
    aliases = ["${var.frontend_network_alias}"]
  }

  networks_advanced {
    name    = docker_network.private_bridge_network.name
    aliases = ["${var.frontend_network_alias}"]
  }
  volumes {
    host_path      = "${path.cwd}/container/frontend/html"
    container_path = "/usr/share/nginx/html"
  }
  volumes {
    host_path      = "${path.cwd}/container/frontend/configs/nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
  }

  volumes {
    host_path      = "${path.cwd}/container/frontend/configs/app.conf"
    container_path = "/etc/nginx/conf.d/app.conf"
  }
}