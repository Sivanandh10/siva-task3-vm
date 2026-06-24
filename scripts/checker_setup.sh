#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update -y -qq
apt-get install -y -qq git nfs-common
mkdir -p /root/todoapp
mount -t nfs workstation.vm.sandbox.internal:/root/todoapp /root/todoapp 2>/dev/null || true