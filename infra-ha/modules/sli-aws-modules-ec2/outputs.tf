output "instance_id" {
  value       = [for v in aws_instance.my_ec2_instance : v.id ]
  description = "L'identifiant unique de l'instance créee."
}

output "private_ip" {
  value       = [ for v in aws_instance.my_ec2_instance : v.private_ip ]
  description = "L'adresse IP privée de l'instance."
}

output "server_name" {
  value = [for v in aws_instance.my_ec2_instance : v.id ]
}