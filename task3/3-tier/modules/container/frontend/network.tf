resource "docker_network" "public_bridge_network" {
  name   = "public_network"
  driver = "bridge"
  check_duplicate = true
  attachable = true
}

resource "docker_network" "private_bridge_network" {
  name     = "database_internal"
  driver   = "bridge"
  internal = true
  check_duplicate = true
  attachable = true
}