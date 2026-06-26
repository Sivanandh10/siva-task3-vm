#!/bin/bash
sshpass -p 'instruqt123' ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 root@workstation.vm.sandbox.internal "cd /root/todoapp && git log --oneline 2>/dev/null | grep -qi 'resolv'" 2>/dev/null
