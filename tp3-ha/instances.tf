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
resource "aws_instance" "web1" {
  ami               = data.aws_ami.amzn.id
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a"
  subnet_id         = aws_subnet.private_a.id
  vpc_security_group_ids = [
    aws_security_group.allow_http_8080.id
  ]

  user_data = data.template_file.web.rendered
}

resource "aws_lb_target_group_attachment" "web1" {
  depends_on       = [aws_instance.web1]
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web1.id
  port             = 8080
}

# web2
resource "aws_instance" "web2" {
  ami               = data.aws_ami.amzn.id
  instance_type     = "t3.medium"
  availability_zone = "us-east-1b"
  subnet_id         = aws_subnet.private_b.id
  vpc_security_group_ids = [
    aws_security_group.allow_http_8080.id
  ]

  user_data = data.template_file.web.rendered
}

resource "aws_lb_target_group_attachment" "web2" {
  depends_on       = [aws_instance.web2]
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web2.id
  port             = 8080
}
