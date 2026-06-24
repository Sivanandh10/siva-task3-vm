#!/bin/bash
cd /root/todoapp && git branch --show-current 2>/dev/null | grep -q 'feature'
