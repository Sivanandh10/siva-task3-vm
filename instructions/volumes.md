# Docker Volumes

> Containers are ephemeral — when they stop, their data is gone. Volumes solve this by persisting data outside the container lifecycle.

---

## Step 1 - Create a volume

    docker volume create mydata

List volumes:

    docker volume ls

You will see mydata in the list.

---

## Step 2 - Mount it in a container

Run a container with the volume mounted at /data:

    docker run -d --name datastore -v mydata:/data nginx

Write something to it:

    docker exec datastore sh -c "echo 'persistent data' > /data/test.txt"

Read it back:

    docker exec datastore cat /data/test.txt

---

## Step 3 - Prove persistence

Stop and remove the container, then read the data from a new one:

    docker stop datastore
    docker rm datastore
    docker run --rm -v mydata:/data alpine cat /data/test.txt

The data survived the container being deleted. That is the power of volumes.

Then click **Check**.

<instruqt-task id="volumes"></instruqt-task>