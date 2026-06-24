#!/bin/bash
cd /root/todoapp && [ $(git log feature --oneline 2>/dev/null | wc -l) -ge 2 ]
