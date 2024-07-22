data "aws_ami" "amzn" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = [
      "al2023-ami-2023.*-x86_64"
    ]
  }
}

resource "aws_instance" "my_ec2_instance" {
  count = var.instance_number
  ami           = data.aws_ami.amzn.id
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  tags = {
    Name = "${var.server_name}-${count.index}"
  }
}
