#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update -y -qq
apt-get install -y -qq openssh-client
mkdir -p /root/.ssh
chmod 700 /root/.ssh
# Get SSH key from VM
scp -o StrictHostKeyChecking=no root@workstation.vm.sandbox.internal:/tmp/vm_key /root/.ssh/vm_key 2>/dev/null
chmod 600 /root/.ssh/vm_key