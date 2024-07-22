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

data "template_file" "init" {
  template = file("./user-data.tpl")
  vars = {
    private_ip = "${aws_instance.lamp.private_ip}"
    subnet_id  = "${aws_instance.lamp.subnet_id}"
  }
}


resource "aws_instance" "lamp" {
  ami           = data.aws_ami.amzn.id
  instance_type = "t2.medium"

  user_data = file("${data.template_file.init.rendered}")

}
