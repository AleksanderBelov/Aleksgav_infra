#!/bin/bash
set -e

sudo cp /tmp/mongod.conf /etc/mongod.conf
sudo service mongod restart
