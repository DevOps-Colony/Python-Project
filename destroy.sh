#!/bin/bash

cd terraform/staging

terraform init -backend-config="../../backend.tf"
terraform destroy -auto-approve
