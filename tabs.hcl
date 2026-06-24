resource "terminal" "shell" {
  target = resource.vm.workstation
  shell  = "/bin/bash"
}

resource "editor" "code" {
  workspace "project" {
    directory = "/root/todoapp"
    target    = resource.vm.workstation
  }
}

resource "service" "liveapp" {
  target = resource.vm.workstation
  port   = 80
  path   = "/"
}

resource "service" "gitlog" {
  target = resource.vm.workstation
  port   = 8080
  path   = "/"
}
