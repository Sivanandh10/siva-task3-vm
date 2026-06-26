# Docker Networking

> By default containers are isolated. Docker networks let containers talk to each other by name.

---

## Step 1 - List existing networks

    docker network ls

You will see bridge, host, and none — the three default networks.

---

## Step 2 - Create a custom network

    docker network create labnet

List again:

    docker network ls

You will see labnet in the list.

---

## Step 3 - Run containers on the network

Start two containers on labnet:

    docker run -d --name app1 --network labnet nginx
    docker run -d --name app2 --network labnet alpine sleep 3600

Test that app2 can reach app1 by name:

    docker exec app2 wget -qO- http://app1

You should see the nginx welcome HTML. Containers on the same network can reach each other by container name — no IP address needed.

---

## Step 4 - Inspect the network

    docker network inspect labnet | jq '.[0].Containers'

You will see both app1 and app2 listed with their IPs.

Then click **Check** to complete the workshop.

<instruqt-task id="networking"></instruqt-task>