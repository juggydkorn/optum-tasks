terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
host    = "npipe:////.//pipe//docker_engine"

registry_auth {
    address = "quay.io:8181"
    username = "jagdeep.devops@gmail.com"
    password = "jagdeep123"
  }
}