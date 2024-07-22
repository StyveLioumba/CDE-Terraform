#!/bin/bash
echo "Hola , ceci est un script executé sur ${aws_instance.lamp.private_ip}."
echo "Cette instance est dans le sous-reseau ${aws_instance.lamp.subnet_id}."