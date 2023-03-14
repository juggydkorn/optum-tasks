resource "docker_image" "web_image" {
  name = "httpd:latest"
}

resource "docker_image" "mysql_image" {
  name = "mysql:5.7"
}