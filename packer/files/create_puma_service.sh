#!/bin/bash
set -e

cd ~/reddit

tee reddit.puma.service << EOF
[Unit]
Description=Start reddit puma server
After=network.target

[Service]
Type=simple
WorkingDirectory=`pwd`
ExecStart=`which bundle` exec puma -b tcp://0.0.0.0:9292
RestartSec=5
TimeoutStartSec=5
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl enable `pwd`/reddit.puma.service
