resource "layout" "welcome" {
  column {
    width = "50"
    instructions {}
  }
  column {
    width = "50"
    tab "terminal" {
      title  = "Terminal"
      target = resource.terminal.shell
      active = true
    }
  }
}

resource "layout" "init_commit" {
  column {
    width = "50"
    instructions {}
  }
  column {
    width = "50"
    tab "terminal" {
      title  = "Terminal"
      target = resource.terminal.shell
      active = true
    }
    tab "editor" {
      title  = "Code Editor"
      target = resource.editor.code
    }
    tab "liveapp" {
      title  = "Live App"
      target = resource.service.liveapp
    }
  }
}

resource "layout" "branching" {
  column {
    width = "50"
    instructions {}
  }
  column {
    width = "50"
    tab "terminal" {
      title  = "Terminal"
      target = resource.terminal.shell
      active = true
    }
    tab "editor" {
      title  = "Code Editor"
      target = resource.editor.code
    }
    tab "liveapp" {
      title  = "Live App"
      target = resource.service.liveapp
    }
  }
}

resource "layout" "merging" {
  column {
    width = "50"
    instructions {}
  }
  column {
    width = "50"
    tab "terminal" {
      title  = "Terminal"
      target = resource.terminal.shell
      active = true
    }
    tab "liveapp" {
      title  = "Live App"
      target = resource.service.liveapp
    }
    tab "gitlog" {
      title  = "Git History"
      target = resource.service.gitlog
    }
  }
}

resource "layout" "conflict" {
  column {
    width = "50"
    instructions {}
  }
  column {
    width = "50"
    tab "terminal" {
      title  = "Terminal"
      target = resource.terminal.shell
      active = true
    }
    tab "editor" {
      title  = "Code Editor"
      target = resource.editor.code
    }
    tab "liveapp" {
      title  = "Live App"
      target = resource.service.liveapp
    }
    tab "gitlog" {
      title  = "Git History"
      target = resource.service.gitlog
    }
  }
}