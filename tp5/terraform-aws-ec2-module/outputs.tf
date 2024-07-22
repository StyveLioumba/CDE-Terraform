output "instance_id" {
  value       = aws_instance.my_ec2_instance
  description = "L'identifiant unique de l'instance créee."
}

output "private_id" {
  value       = aws_instance.my_ec2_instance
  description = "L'adresse IP privée de l'instance."
}

output "server_name" {
  value = aws_instance.my_ec2_instance
}