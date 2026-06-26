#!/bin/bash
sshpass -p 'instruqt123' ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 root@workstation.vm.sandbox.internal "test -d /root/todoapp/.git" 2>/dev/null
