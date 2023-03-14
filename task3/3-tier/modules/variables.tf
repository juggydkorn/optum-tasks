#Define variables
variable "container_name" {
  description = "Name of the container."
  default     = "task3"
}
variable "image_name" {
  description = "Image for container."
  default     = "httpd:latest"
}
variable "int_port" {
  description = "Internal port for container."
  default     = "2368"
}
variable "ext_port" {
  description = "External port for container."
  default     = "80"
}