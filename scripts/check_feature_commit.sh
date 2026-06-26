#!/bin/bash
sshpass -p 'instruqt123' ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 root@workstation.vm.sandbox.internal "cd /root/todoapp && [ \$(git log feature --oneline 2>/dev/null | wc -l) -ge 2 ]" 2>/dev/null
