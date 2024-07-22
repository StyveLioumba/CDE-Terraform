output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID du VPC"
}

output "instance_id" {
  value       = module.ec2.instance_id
  description = "ID des instances."
}

output "subnets" {
  value = aws_subnet.subnets
}
