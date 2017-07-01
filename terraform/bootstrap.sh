#!/bin/bash

BRANCH=$1

boot_env() {
echo "Please press enter to start bootstrap of infra or CRTL D to quit... "
read
if [ $# -eq 0 ]; then echo "Please supply the name of the branch that you want to bootstrap..."; exit; fi
sed -i s/TAG/$1/g *.tf
terraform apply
}

boot_env
