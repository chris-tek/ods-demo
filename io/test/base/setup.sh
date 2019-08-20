#!/usr/bin/env bash

#
# this script is used for bootstraping the project base infrastructure
#

# create base infra
terraform init setup
terraform apply setup