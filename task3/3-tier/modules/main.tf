terraform {
    required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Download the image
module "image" {
  source = "./image"
  image_name  = "${var.image_name}"
}

# Start the container
module "container" {
  source             = "./container"
  image              = "${module.image.image_out}"
  container_name     = "${var.container_name}"
  int_port           = "${var.int_port}"
  ext_port           = "${var.ext_port}"
}