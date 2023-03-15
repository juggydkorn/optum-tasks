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
variable "mysql_root_password" {
  description = "The MySQL root password."
  default     = "root"
}

variable "frontend_db_username" {
  description = "Frontend database username."
  default     = "root"
}

variable "frontend_db_name" {
  description = "Frontend database name."
  default     = "frontend"
}
