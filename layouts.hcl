resource "layout" "two_column" {
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
