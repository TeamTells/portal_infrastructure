#!/bin/bash

SCRIPT_PATH="$(dirname "$(readlink -f "$0")")"
PROJECT_ROOT="$SCRIPT_PATH/../../"

cd $PROJECT_ROOT/ansible
ansible-playbook main.yml -i staging -Kvv
