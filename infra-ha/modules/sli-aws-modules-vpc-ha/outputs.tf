output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID du VPC"
}

output "public_subnets" {
  value       = { for k, v in aws_subnet.public : k => v.id }
  description = "Map des sous-reseaux publiques"
}
output "private_subnets" {
  value       = { for k, v in aws_subnet.private : k => v.id }
  description = "Map des sous-reseaux publiques"
}