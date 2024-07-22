resource "aws_security_group" "allow_http_lb" {
  name        = "allow_http 80"
  description = "Allow http inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_lb_ipv4" {
  security_group_id = aws_security_group.allow_http_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Repondre à n'importe quel client
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_lb_ipv4" {
  security_group_id = aws_security_group.allow_http_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
