# Init and Commit

Every project starts with `git init`. Create the app skeleton and see it live.

---

## Step 1 - Initialise the repo

```bash,run
cd /root/todoapp
git init
```

---

## Step 2 - Create the skeleton

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
    <p>Coming soon...</p>
  </div>
</body>
</html>
EOF
```

```bash,run
cat > style.css << 'EOF'
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: sans-serif; background: #f0f2f5; display: flex; justify-content: center; padding: 40px 20px; }
.app { background: white; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
h1 { font-size: 24px; margin-bottom: 16px; color: #333; }
EOF
```

Check the **Live App** tab to see your page.

---

## Step 3 - Commit the skeleton

```bash,run
git add index.html style.css
git commit -m "initial commit"
```

```bash,run
git log --oneline
```

<instruqt-task id="init_commit"></instruqt-task>