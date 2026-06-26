resource "task" "init_commit" {
  description = "Initialise the repo and create the app skeleton"

  config {
    target = resource.container.checker
  }

  condition "repo_init" {
    description = "Initialise a Git repo in /root/todoapp"
    setup {
      script = "scripts/checker_setup.sh"
    }
    check {
      script = "scripts/check_init.sh"
    }
  }

  condition "first_commit" {
    description = "Commit the skeleton with message 'initial commit'"
    check {
      script = "scripts/check_commit.sh"
    }
  }
}

resource "task" "branching" {
  description = "Add todo functionality on a feature branch"

  config {
    target = resource.container.checker
  }

  condition "branch_created" {
    description = "Create a branch named 'feature'"
    check {
      script = "scripts/check_branch.sh"
    }
  }

  condition "branch_switched" {
    description = "Switch to the feature branch"
    check {
      script = "scripts/check_switched.sh"
    }
  }
}

resource "task" "merging" {
  description = "Merge the todo feature into main"

  config {
    target = resource.container.checker
  }

  condition "feature_commit" {
    description = "Add the full todo functionality on feature branch"
    check {
      script = "scripts/check_feature_commit.sh"
    }
  }

  condition "merged" {
    description = "Merge feature into main"
    check {
      script = "scripts/check_merged.sh"
    }
  }
}

resource "task" "conflict" {
  description     = "Style the app and resolve the conflict"
  success_message = "Outstanding! Your Todo App is complete and deployed with Git!"

  config {
    target = resource.container.checker
  }

  condition "conflict_resolved" {
    description = "Resolve the style conflict and commit the final app"
    check {
      script = "scripts/check_conflict.sh"
    }
  }
}