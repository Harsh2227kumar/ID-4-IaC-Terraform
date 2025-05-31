terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_server" {
  name  = "nginx_container"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8080
  }
}
