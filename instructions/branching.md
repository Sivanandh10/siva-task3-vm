# Feature Branch

Real teams never code directly on main. Create a feature branch and build the todo functionality there.

---

## Step 1 - Create and switch to the feature branch

```bash,run
git branch feature
git checkout feature
```

```bash,run
git branch
```

---

## Step 2 - Add the todo functionality

```bash,run
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Todo App</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="app">
    <h1>My Todo App</h1>
    <div class="input-row">
      <input type="text" id="todoInput" placeholder="Add a new task..." />
      <button onclick="addTodo()">Add</button>
    </div>
    <ul id="todoList"></ul>
  </div>
  <script>
    function addTodo() {
      const input = document.getElementById('todoInput');
      const text = input.value.trim();
      if (!text) return;
      const li = document.createElement('li');
      li.innerHTML = '<span onclick="this.parentElement.classList.toggle(\'done\')">' + text + '</span><button onclick="this.parentElement.remove()">x</button>';
      document.getElementById('todoList').appendChild(li);
      input.value = '';
    }
    document.getElementById('todoInput').addEventListener('keypress', function(e) {
      if (e.key === 'Enter') addTodo();
    });
  </script>
</body>
</html>
EOF
```

Check the **Live App** tab - the full todo app is live!

---

## Step 3 - Commit on the feature branch

```bash,run
git add index.html
git commit -m "add todo functionality"
```

<instruqt-task id="branching"></instruqt-task>