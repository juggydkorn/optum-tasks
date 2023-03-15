#Define variables
variable "container_name" {}
variable "image" {}
variable "int_port" {}
variable "ext_port" {}
variable "database_network_alias" {
  description = "The network alias for MySQL."
  default     = "database"
}

variable "frontend_network_alias" {
  description = "The network alias"
  default     = "frontend"
}
