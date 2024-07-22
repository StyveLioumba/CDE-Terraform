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

data "template_file" "web" {
  template = file("./scripts/deploy-web-container.yaml")
}

# web1
resource "aws_instance" "lamp" {

  for_each = {
    "us-east-1a" = "subnet-05faca9d236860ebe",
    "us-east-1b" = "subnet-0163f350df7f40adf"
  }

  ami           = data.aws_ami.amzn.id
  instance_type = "t3.medium"

  tags = {
    Name = "lamp-${each.key}"
  }
}
