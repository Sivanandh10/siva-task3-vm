resource "lab" "siva_task3_vm" {
  title       = "Build a Todo App with Git"
  description = "Learn Git by building and versioning a real working Todo application."
  layout      = resource.layout.two_column

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
      }
      page "init_commit" {
        reference = resource.page.init_commit
      }
      page "branching" {
        reference = resource.page.branching
      }
    }

    chapter "git_collaboration" {
      title = "Collaboration"

      page "merging" {
        reference = resource.page.merging
      }
      page "conflict" {
        reference = resource.page.conflict
      }
    }
  }
}

