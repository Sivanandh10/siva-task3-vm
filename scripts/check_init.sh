#!/bin/bash
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -i /root/.ssh/vm_key root@workstation.vm.sandbox.internal "test -d /root/todoapp/.git" 2>/dev/null