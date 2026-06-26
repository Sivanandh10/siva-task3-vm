resource "terminal" "shell" {
  target = resource.container.workstation
  shell  = "/bin/bash"
}

resource "editor" "code" {
  workspace "project" {
    directory = "/root/todoapp"
    target    = resource.container.workstation
  }
}

resource "service" "liveapp" {
  target = resource.container.workstation
  port   = 80
  path   = "/"
}

resource "service" "gitlog" {
  target = resource.container.workstation
  port   = 8080
  path   = "/"
}
