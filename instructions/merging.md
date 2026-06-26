# Merging

> The feature is ready. Merge it into main so the production version gets the update.

---

## Step 1 - Switch back to main

    git checkout main

Open the **Live App** tab — it shows "Coming soon..." again. Main hasn't been updated yet.

---

## Step 2 - Merge feature into main

    git merge feature

Open the **Live App** tab — the full working todo app is now live on main!

Verify:

    git log --oneline

Check **Git History** — you can see both commits on main now.

Click **Check**.

<instruqt-task id="merging"></instruqt-task>