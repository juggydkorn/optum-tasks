variable "mysql_root_password" {
  description = "The MySQL root password."
  default     = "P4sSw0rd0!"
}

variable "web_db_username" {
  description = "Web database username."
  default     = "root"
}

variable "web_db_name" {
  description = "Web database name."
  default     = "web"
}

variable "mysql_network_alias" {
  description = "The network alias for MySQL."
  default     = "db"
}

variable "web_network_alias" {
  description = "The network alias for Ghost"
  default     = "web"
}

variable "ext_port" {
  description = "Public port for Ghost"
  default     = "8080"
}