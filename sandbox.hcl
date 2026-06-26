resource "network" "main" {
  subnet = "10.0.230.0/24"
}

resource "container" "workstation" {
  image {
    name = "ubuntu:22.04"
  }
  network {
    id = resource.network.main.meta.id
  }
  port {
    local = 80
  }
  port {
    local = 8080
  }
}

resource "exec" "bootstrap" {
  target = resource.container.workstation
  script = "scripts/bootstrap.sh"
}
