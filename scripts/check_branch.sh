#!/bin/bash
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -i /root/.ssh/vm_key root@workstation.vm.sandbox.internal "cd /root/todoapp && git branch 2>/dev/null | grep -q 'feature'" 2>/dev/null