resource "lab" "siva_task3_vm" {
  title       = "Build a Todo App with Git"
  description = "Learn Git by building and versioning a real working Todo application."
  layout      = resource.layout.welcome

  settings {
    timelimit {
      duration   = "60m"
      show_timer = true
    }
  }

  content {
    chapter "git_basics" {
      title = "Git Basics"

      page "overview" {
        reference = resource.page.overview
        layout    = resource.layout.welcome
      }
      page "init_commit" {
        reference = resource.page.init_commit
        layout    = resource.layout.init_commit
      }
      page "branching" {
        reference = resource.page.branching
        layout    = resource.layout.branching
      }
    }

    chapter "git_collaboration" {
      title = "Collaboration"

      page "merging" {
        reference = resource.page.merging
        layout    = resource.layout.merging
      }
      page "conflict" {
        reference = resource.page.conflict
        layout    = resource.layout.conflict
      }
    }
  }
}
