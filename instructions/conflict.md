# Style and Resolve

Two developers added different styles at the same time. Resolve the conflict.

---

## Step 1 - Add dark theme on main

```bash,run
git checkout main
```

```bash,run
cat > style.css << 'EOF'
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: sans-serif; background: #1a1a2e; display: flex; justify-content: center; padding: 40px 20px; }
.app { background: #16213e; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; }
h1 { font-size: 24px; margin-bottom: 16px; color: #e94560; }
.input-row { display: flex; gap: 8px; margin-bottom: 20px; }
.input-row input { flex: 1; padding: 10px; border-radius: 8px; border: none; background: #0f3460; color: white; }
.input-row button { padding: 10px 18px; background: #e94560; color: white; border: none; border-radius: 8px; cursor: pointer; }
#todoList { list-style: none; }
#todoList li { display: flex; justify-content: space-between; padding: 12px; background: #0f3460; border-radius: 8px; margin-bottom: 8px; color: #eee; }
EOF
```

```bash,run
git add style.css
git commit -m "add dark theme on main"
```

---

## Step 2 - Add purple theme on feature

```bash,run
git checkout feature
```

```bash,run
cat > style.css << 'EOF'
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: sans-serif; background: #2d1b69; display: flex; justify-content: center; padding: 40px 20px; }
.app { background: #11001c; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; }
h1 { font-size: 24px; margin-bottom: 16px; color: #a855f7; }
.input-row { display: flex; gap: 8px; margin-bottom: 20px; }
.input-row input { flex: 1; padding: 10px; border-radius: 8px; border: none; background: #3b0764; color: white; }
.input-row button { padding: 10px 18px; background: #a855f7; color: white; border: none; border-radius: 8px; cursor: pointer; }
#todoList { list-style: none; }
#todoList li { display: flex; justify-content: space-between; padding: 12px; background: #3b0764; border-radius: 8px; margin-bottom: 8px; color: #eee; }
EOF
```

```bash,run
git add style.css
git commit -m "add purple theme on feature"
```

---

## Step 3 - Trigger the conflict

```bash,run
git checkout main
git merge feature
```

Open **Code Editor** to see the conflict markers in style.css.

---

## Step 4 - Resolve it

```bash,run
cat > style.css << 'EOF'
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: sans-serif; background: #1a1a2e; display: flex; justify-content: center; padding: 40px 20px; }
.app { background: #16213e; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; }
h1 { font-size: 24px; margin-bottom: 16px; color: #e94560; }
.input-row { display: flex; gap: 8px; margin-bottom: 20px; }
.input-row input { flex: 1; padding: 10px; border-radius: 8px; border: none; background: #0f3460; color: white; }
.input-row button { padding: 10px 18px; background: #e94560; color: white; border: none; border-radius: 8px; cursor: pointer; }
#todoList { list-style: none; }
#todoList li { display: flex; justify-content: space-between; padding: 12px; background: #0f3460; border-radius: 8px; margin-bottom: 8px; color: #eee; }
EOF
```

```bash,run
git add style.css
git commit -m "resolve merge conflict"
```

Check the **Live App** tab - your final styled Todo app is live!

<instruqt-task id="conflict"></instruqt-task>