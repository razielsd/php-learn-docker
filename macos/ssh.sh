#!/usr/bin/env bash

echo "Use password: root"
ssh -p 2222 -o "UserKnownHostsFile /dev/null" -o "LogLevel ERROR" root@localhost