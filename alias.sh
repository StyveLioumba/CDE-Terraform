#!/bin/bash

echo "alias tfi='terraform init'" >> ~/.bashrc
echo "alias tfp='terraform plan'" >> ~/.bashrc
echo "alias tff='terraform fmt'" >> ~/.bashrc
echo "alias tfaa='terraform apply -auto-approuve'" >> ~/.bashrc
echo "alias tfl='terraform state list'" >> ~/.bashrc
echo "alias tfs='terraform state show'" >> ~/.bashrc

source ~/.bashrc