#Define variables
variable "frontend_container_name" {
  description = "Name of the container."
  default     = "web"
}
variable "backend_container_name" {
  description = "Name of the container."
  default     = "web_back"
}
variable "database_container_name" {
  description = "Name of the container."
  default     = "web_db"
}
variable "frontend_image_name" {
  description = "Image for container."
  default     = "nginx:latest"
}
variable "backend_image_name" {
  description = "Image for container."
  default     = "httpd:latest"
}
variable "database_image_name" {
  description = "Image for container."
  default     = "mysql:5.7"
}
variable "int_port" {
  description = "Internal port for container."
  default     = "80"
}
variable "ext_port" {
  description = "External port for container."
  default     = "8000"
}
