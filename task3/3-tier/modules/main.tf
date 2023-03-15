
# Download the image
module "frontend_image" {
  source     = "./image"
  image_name = var.frontend_image_name
}
module "backend_image" {
  source     = "./image"
  image_name = var.backend_image_name
}
module "database_image" {
  source     = "./image"
  image_name = var.database_image_name
}

# Start the container

module "backend_container" {
  source         = "./container/backend"
  image          = module.backend_image.image_out
  container_name = var.backend_container_name
  int_port       = var.int_port
  ext_port       = var.ext_port

}

module "database_container" {
  source         = "./container/database"
  image          = module.database_image.image_out
  container_name = var.database_container_name
  int_port       = var.int_port
  ext_port       = var.ext_port
}

module "frontend_container" {
  source         = "./container/frontend"
  image          = module.frontend_image.image_out
  container_name = var.frontend_container_name
  int_port       = var.int_port
  ext_port       = var.ext_port
}
