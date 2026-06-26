# Init and Commit

> Every project starts with `git init`. Let's create the app skeleton and see it live.

---

## Step 1 - Initialise the repo

    cd /root/todoapp
    git init

---

## Step 2 - Create the skeleton

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
        <h1>📝 My Todo App</h1>
        <p>Coming soon...</p>
      </div>
    </body>
    </html>
    EOF

    cat > style.css << 'EOF'
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: sans-serif; background: #f0f2f5; display: flex; justify-content: center; padding: 40px 20px; }
    .app { background: white; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
    h1 { font-size: 24px; margin-bottom: 16px; color: #333; }
    EOF

Open the **Live App** tab — you should see "My Todo App" with "Coming soon..."

---

## Step 3 - Commit the skeleton

    git add index.html style.css
    git commit -m "initial commit"

Open the **Git History** tab — click Refresh to see your first commit appear!

    git log --oneline

Click **Check**.

<instruqt-task id="init_commit"></instruqt-task>