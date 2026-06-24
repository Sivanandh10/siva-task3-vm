# Inspect Containers

> Docker inspect gives you full details about any container — IP address, mounts, environment variables, network settings.

---

## Step 1 - View running containers

    docker ps

Note the container ID or name of your webserver container.

---

## Step 2 - Inspect it

    docker inspect webserver

This prints a large JSON object. Pipe it through jq to read it cleanly:

    docker inspect webserver | jq '.[0].NetworkSettings'

---

## Step 3 - Save the inspect output

    docker inspect webserver > /root/docker-workshop/inspect.json

Verify:

    cat /root/docker-workshop/inspect.json | jq '.[0].NetworkSettings.IPAddress'

You will see the container's internal IP address. Click the **Workshop Files** tab to see the file appear in the editor.

Then click **Check**.

<instruqt-task id="inspect"></instruqt-task>