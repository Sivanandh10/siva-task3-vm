# Merging

The feature is ready. Merge it into main.

---

## Step 1 - Switch back to main

```bash,run
git checkout main
```

Check the **Live App** tab - it reverts to "Coming soon..." because main is not updated yet.

---

## Step 2 - Merge feature into main

```bash,run
git merge feature
```

Check the **Live App** tab - the full todo app is now live on main!

```bash,run
git log --oneline
```

<instruqt-task id="merging"></instruqt-task>