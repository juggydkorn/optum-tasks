resource "docker_network" "public_bridge_network" {
  name   = "public_network"
  driver = "bridge"
}

resource "docker_network" "private_bridge_network" {
  name     = "mysql_internal"
  driver   = "bridge"
  internal = true
}