terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_container" "web_container" {
  name  = "web"
  image = "${docker_image.web_image.name}"
  env   = [
    "database__client=mysql",
    "database__connection__host=${var.mysql_network_alias}",
    "database__connection__user=${var.web_db_username}",
    "database__connection__password=${var.mysql_root_password}",
    "database__connection__database=${var.web_db_name}"
  ]
  ports {
    internal = "2368"
    external = "${var.ext_port}"
  }
  networks_advanced {
    name    = "${docker_network.public_bridge_network.name}"
    aliases = ["${var.web_network_alias}"]
  }
  networks_advanced {
    name    = "${docker_network.private_bridge_network.name}"
    aliases = ["${var.web_network_alias}"]
  }
}

resource "docker_container" "mysql_container" {
  name  = "web_database"
  image = "${docker_image.mysql_image.name}"
  env   = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}"
  ]
  networks_advanced {
    name    = "${docker_network.private_bridge_network.name}"
    aliases = ["${var.mysql_network_alias}"]
  }
}