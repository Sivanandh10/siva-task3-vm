# Style and Resolve

> Two developers added different styles at the same time. Now there is a conflict. You need to resolve it.

---

## Step 1 - Add a dark theme on main

    git checkout main
    cat > style.css << 'EOF'
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: sans-serif; background: #1a1a2e; display: flex; justify-content: center; padding: 40px 20px; }
    .app { background: #16213e; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; box-shadow: 0 4px 20px rgba(0,0,0,0.4); }
    h1 { font-size: 24px; margin-bottom: 16px; color: #e94560; }
    .input-row { display: flex; gap: 8px; margin-bottom: 20px; }
    .input-row input { flex: 1; padding: 10px 14px; border-radius: 8px; border: none; background: #0f3460; color: white; font-size: 15px; }
    .input-row button { padding: 10px 18px; background: #e94560; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 15px; }
    #todoList { list-style: none; }
    #todoList li { display: flex; justify-content: space-between; align-items: center; padding: 12px; background: #0f3460; border-radius: 8px; margin-bottom: 8px; color: #eee; }
    #todoList li.done span { text-decoration: line-through; opacity: 0.5; }
    #todoList li button { background: none; border: none; color: #e94560; cursor: pointer; font-size: 16px; }
    EOF
    git add style.css
    git commit -m "add dark theme on main"

Open **Live App** — dark theme is live!

---

## Step 2 - Add a purple theme on feature

    git checkout feature
    cat > style.css << 'EOF'
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: sans-serif; background: #2d1b69; display: flex; justify-content: center; padding: 40px 20px; }
    .app { background: #11001c; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; box-shadow: 0 4px 20px rgba(0,0,0,0.5); }
    h1 { font-size: 24px; margin-bottom: 16px; color: #a855f7; }
    .input-row { display: flex; gap: 8px; margin-bottom: 20px; }
    .input-row input { flex: 1; padding: 10px 14px; border-radius: 8px; border: none; background: #3b0764; color: white; font-size: 15px; }
    .input-row button { padding: 10px 18px; background: #a855f7; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 15px; }
    #todoList { list-style: none; }
    #todoList li { display: flex; justify-content: space-between; align-items: center; padding: 12px; background: #3b0764; border-radius: 8px; margin-bottom: 8px; color: #eee; }
    #todoList li.done span { text-decoration: line-through; opacity: 0.5; }
    #todoList li button { background: none; border: none; color: #a855f7; cursor: pointer; font-size: 16px; }
    EOF
    git add style.css
    git commit -m "add purple theme on feature"

---

## Step 3 - Trigger the conflict

    git checkout main
    git merge feature

Git reports a conflict in `style.css`. Open **Code Editor** to see the conflict markers.

---

## Step 4 - Resolve it

Pick the dark theme (or keep whichever you like) and write clean CSS with no conflict markers:

    cat > style.css << 'EOF'
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: sans-serif; background: #1a1a2e; display: flex; justify-content: center; padding: 40px 20px; }
    .app { background: #16213e; border-radius: 12px; padding: 32px; width: 100%; max-width: 480px; box-shadow: 0 4px 20px rgba(0,0,0,0.4); }
    h1 { font-size: 24px; margin-bottom: 16px; color: #e94560; }
    .input-row { display: flex; gap: 8px; margin-bottom: 20px; }
    .input-row input { flex: 1; padding: 10px 14px; border-radius: 8px; border: none; background: #0f3460; color: white; font-size: 15px; }
    .input-row button { padding: 10px 18px; background: #e94560; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 15px; }
    #todoList { list-style: none; }
    #todoList li { display: flex; justify-content: space-between; align-items: center; padding: 12px; background: #0f3460; border-radius: 8px; margin-bottom: 8px; color: #eee; }
    #todoList li.done span { text-decoration: line-through; opacity: 0.5; }
    #todoList li button { background: none; border: none; color: #e94560; cursor: pointer; font-size: 16px; }
    EOF

    git add style.css
    git commit -m "resolve merge conflict"

Open **Live App** — your final styled Todo app is live!
Check **Git History** — your full commit history is there.

Click **Check** to complete the workshop.

<instruqt-task id="conflict"></instruqt-task>