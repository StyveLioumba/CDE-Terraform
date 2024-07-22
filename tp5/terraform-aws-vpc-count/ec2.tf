module "ec2" {
  source          = "../terraform-aws-ec2-module"
  subnet_id       = aws_subnet.subnets[0].id
  server_name     = "server"
  instance_number = 2
}