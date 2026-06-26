#!/bin/bash
cd /root/todoapp && git log --oneline 2>/dev/null | grep -qi 'initial commit'
