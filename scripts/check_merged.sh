#!/bin/bash
cd /root/todoapp && git log main --oneline 2>/dev/null | wc -l | xargs -I{} test {} -ge 2
