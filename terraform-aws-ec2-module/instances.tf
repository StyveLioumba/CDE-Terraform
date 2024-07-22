module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.medium"
  monitoring             = true

  ami = "ami-04a81a99f5ec58529"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}