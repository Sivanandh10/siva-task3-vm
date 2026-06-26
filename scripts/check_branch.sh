#!/bin/bash
sshpass -p 'instruqt123' ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 root@workstation.vm.sandbox.internal "cd /root/todoapp && git branch 2>/dev/null | grep -q 'feature'" 2>/dev/null
