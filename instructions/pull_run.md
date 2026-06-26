# Pull and Run Containers

> Every Docker workflow starts with pulling an image and running a container. Let's do both.

---

## How Docker images work

| Concept | Explanation |
|---------|-------------|
| **Image** | A read-only template — like a snapshot of an OS + app |
| **Container** | A running instance of an image |
| **Registry** | Where images are stored (Docker Hub is the default) |

---

## Step 1 - Pull and run hello-world

The simplest possible container — pulls, runs, prints a message, exits:

    docker run hello-world

Check it ran:

    docker ps -a

You will see hello-world in the list with status Exited.

---

## Step 2 - Run nginx on port 8080

Run a real web server in the background:

    docker run -d -p 8080:80 --name webserver nginx

Verify it is running:

    docker ps

You should see webserver with port 0.0.0.0:8080->80/tcp.

Test it:

    curl localhost:8080

You should see the nginx welcome HTML.

---

When both tasks are done click **Check**. Both conditions must pass.

<instruqt-task id="pull_run"></instruqt-task>